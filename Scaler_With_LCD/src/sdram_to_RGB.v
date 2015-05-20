module sdram_to_RGB(
    //To ahb master, access DDRC
    clk_ahb,
    rst_ahb_n,
    m_ahb_mastlock,
    m_ahb_prot,
    m_ahb_size,
    m_ahb_addr,
    m_ahb_write,
    m_ahb_burst,
    m_ahb_trans,
    m_ahb_wdata,
    m_ahb_ready,
    m_ahb_resp,
    m_ahb_rdata,

    //start load signal
    display_sel,
    gpio_out,

    //To LCD driving
    tx_sclk,
    h_valid,
    v_valid,
    de_o,
    pixel_r,
    pixel_g,
    pixel_b,
	buttonIn2,
	buttonIn3,
	buttonIn4
);
input           clk_ahb;
input           rst_ahb_n;
output          m_ahb_mastlock;
output [3:0]    m_ahb_prot;
output [2:0]    m_ahb_size;
output [31:0]   m_ahb_addr;
output          m_ahb_write;
output [2:0]    m_ahb_burst;
output [1:0]    m_ahb_trans;
output [31:0]   m_ahb_wdata;
input           m_ahb_ready;
input           m_ahb_resp;
input  [31:0]   m_ahb_rdata;

input           display_sel;
input  [31:0]   gpio_out;

input           tx_sclk;
input           h_valid;
input           v_valid;
output          de_o;
output [7:0]    pixel_r;
output [7:0]    pixel_g;
output [7:0]    pixel_b;

input			buttonIn2;
input			buttonIn3;
input			buttonIn
//--------------------------------

reg             dma_start_xfer;
reg [31:0]      dma_addr;
// Outputs to the DMA 
wire [31:0]     ahm_rdata;
wire            ahm_rdata_push;
wire            ahm_xfer_done;

reg display_before_bmp;
reg [1:0] bmp_fig_chg;
reg [3:0] bmp_fig_cnt;
reg [1:0] v_valid_r;
reg display_period_align;
wire de_i;
reg [1:0] de_i_r;
reg de_i_start_pulse;
reg other_1_beat_valid;
reg other_1_beat_start_pulse;
reg dma_start_xfer_prev;
reg [10:0] addr_cnt;
reg buffer_wr_sel;//0:buffer0, 1:buffer1
reg [31:0] ahm_rdata_r;
reg ahm_rdata_push_wr0;
reg ahm_rdata_push_wr1;
reg [8:0] emb_addr_wr;
reg [8:0] emb_addr_wr_r;
reg [3:0] de_i_r_sclk;
reg buffer_rd_sel;
reg [1:0] buffer_rd_sel_r;
reg [9:0] emb_addr_rd;
wire [15:0] emb_rdata_0;
wire [15:0] emb_rdata_1;
reg [15:0] emb_rdata_0_r;
reg [15:0] emb_rdata_1_r;
reg de_o;
reg [15:0] emb_rdata_r;


assign m_ahb_mastlock = 0;
assign m_ahb_prot     = 4'h1;

ahb_master u_ahb_master(
    // Inputs from the AHB.
    .hclk_i     (clk_ahb    ),
    .hreset_n   (rst_ahb_n  ),
    .hready_i   (m_ahb_ready),
    .hresp_i    (m_ahb_resp ),
    .hrdata_i   (m_ahb_rdata),
    //.hrdata_i   (m_ahb_rdata_hard),
    // Outputs to the AHB.
    .haddr_o    (m_ahb_addr ),
    .htrans_o   (m_ahb_trans),
    .hwrite_o   (m_ahb_write),
    .hsize_o    (m_ahb_size ),
    .hburst_o   (m_ahb_burst),
    .hwdata_o   (m_ahb_wdata),
    // Inputs from the DMA.
    .dma_start_xfer     (dma_start_xfer     ),
    .dma_addr           (dma_addr           ),
    .dma_rd_wrn         (1'b1),//only read operation
    .dma_burst_count    (8'hff),//256 beats
    .dma_fixed_burst    (1'b1),//use INCR16(defined length bursts)
    .dma_wdata          (),
    .dma_eof            (1'b0),
    // Outputs to the DMA.
    .ahm_rdata          (ahm_rdata          ),
    .ahm_rdata_push     (ahm_rdata_push     ),
    .ahm_wdata_pop      (),
    .ahm_xfer_done      (ahm_xfer_done      ),
    .ahm_error          ()
    );

//----------------------scaler-------------------------------\\
scalerForM7  scaler1(
		.clka(clk_ahb),
		.clkb(clk_ahb ),
		.rst(rst_ahb_n),
		.iHsyn(iHsyn),
		.iVsyn(iVsyn),
		.en(en), 
		.dIn(ahm_rdata_r), 
		.dInEn(dInEn), 
		.dOut(dOut), 
		.dOutEn(dOutEn), 
		.HS(HS), 
		.VS(VS), 
	);

//------------------------- Buffer Write part ----------------\
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        v_valid_r <= 0;
    else
        v_valid_r <= {v_valid_r[0],v_valid};
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        display_before_bmp <= 1;
    else if(v_valid_r == 2'b01) //gpio.bit0, indicate the first BMP loading into DDR done,low active
        display_before_bmp <= gpio_out[0];
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        display_period_align <= 0;
    else if(v_valid_r == 2'b10)
        display_period_align <= 1; //align to begining of a frame
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        bmp_fig_chg <= 0;
    else //gpio.bit1, high pulse indicate bmp figure change
        bmp_fig_chg <= {bmp_fig_chg[0],gpio_out[1]&&(!display_before_bmp)};
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        bmp_fig_cnt <= 0;
    else if(display_before_bmp)
        bmp_fig_cnt <= 0;
    else if(bmp_fig_chg[1:0] == 2'b01)
        bmp_fig_cnt <= bmp_fig_cnt + 1;
end

assign de_i = h_valid & v_valid;
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        de_i_r <= 0;
    else
        de_i_r <= {de_i_r[0],de_i};
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        de_i_start_pulse <= 0;
    else
        de_i_start_pulse <= (de_i_r == 2'b01);
end

always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        other_1_beat_valid <= 0;
    else if(de_i_start_pulse)
        other_1_beat_valid <= 1;
    else if(ahm_xfer_done)
        other_1_beat_valid <= 0;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        other_1_beat_start_pulse <= 0;
    else
        other_1_beat_start_pulse <= ahm_xfer_done && other_1_beat_valid;
end

always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        dma_start_xfer_prev <= 0;
    else
        dma_start_xfer_prev <= display_period_align && (de_i_start_pulse || other_1_beat_start_pulse);
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        dma_start_xfer <= 0;
    else
        dma_start_xfer <= dma_start_xfer_prev;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        addr_cnt <= {10'd1,1'b0};       //write line 1,2,3,4,...,767,  0,1,2,3,4,...
    else if(dma_start_xfer) begin       //read line  0,1,2,3,...,766,767,0,1,2,3,...
        if(addr_cnt == {10'd767,1'b1})  //total 768 line
            addr_cnt <= 0;
        else
            addr_cnt <= addr_cnt + 1;
    end
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        dma_addr <= 0;
    //else //768 line, each line (4*256)*16bit, or 2*256*32bit
        //dma_addr <= {4'h6,2'h0,display_before_bmp,bmp_fig_cnt[3:0],addr_cnt[10:0],10'h0};
    else if(display_sel)//768 line, each line (4*256)*16bit, or 2*256*32bit
        dma_addr <= {4'h6,2'h0,display_before_bmp,bmp_fig_cnt[3:0],addr_cnt[10:0],10'h0};
    else
        dma_addr <= {16'h2000,addr_cnt[5:0],10'h0};
end

always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        buffer_wr_sel <= 0;
    else if(de_i_start_pulse)
        buffer_wr_sel <= ~buffer_wr_sel;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_addr_wr <= 0;
    else if(ahm_rdata_push)
        emb_addr_wr <= emb_addr_wr + 1;
end

always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        ahm_rdata_r <= 0;
    else
        ahm_rdata_r <= ahm_rdata;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        ahm_rdata_push_wr0 <= 0;
    else
        ahm_rdata_push_wr0 <= ahm_rdata_push && !buffer_wr_sel && display_period_align;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        ahm_rdata_push_wr1 <= 0;
    else
        ahm_rdata_push_wr1 <= ahm_rdata_push && buffer_wr_sel && display_period_align;
end
always@(posedge clk_ahb, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_addr_wr_r <= 0;
    else
        emb_addr_wr_r <= emb_addr_wr;
end

emb_v1 u_1kx16_0( //Pingpang buffer 0
    .clkw   (clk_ahb    ),
    .cew    (ahm_rdata_push_wr0),
    .aw     (emb_addr_wr_r),
    .dw     (ahm_rdata_r),
    .clkr   (tx_sclk),
    .cer    (buffer_rd_sel & de_i_r_sclk[1]),
    .ar     (emb_addr_rd),
    .qr     (emb_rdata_0)
);

emb_v1 u_1kx16_1( //Pingpang buffer 1
    .clkw   (clk_ahb    ),
    .cew    (ahm_rdata_push_wr1),
    .aw     (emb_addr_wr_r),
    .dw     (ahm_rdata_r),
    .clkr   (tx_sclk),
    .cer    (!buffer_rd_sel & de_i_r_sclk[1]),
    .ar     (emb_addr_rd),
    .qr     (emb_rdata_1)
);

//------------------------- Buffer Read part ----------------\
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        de_i_r_sclk <= 0;
    else
        de_i_r_sclk <= {de_i_r_sclk[2:0],de_i};
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        buffer_rd_sel <= 0;
    else if(de_i_r_sclk[1:0] == 2'b01)
        buffer_rd_sel <= ~buffer_rd_sel;
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_addr_rd <= 0;
    else if(de_i_r_sclk[1])
        emb_addr_rd <= emb_addr_rd + 1;
    else
        emb_addr_rd <= 0;
end

always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        buffer_rd_sel_r <= 0;
    else
        buffer_rd_sel_r <= {buffer_rd_sel_r[0],buffer_rd_sel};
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_rdata_0_r <= 0;
    else
        emb_rdata_0_r <= emb_rdata_0;
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_rdata_1_r <= 0;
    else
        emb_rdata_1_r <= emb_rdata_1;
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        emb_rdata_r <= 0;
    else
        emb_rdata_r <= buffer_rd_sel_r[1] ? emb_rdata_0_r : emb_rdata_1_r;
end
always@(posedge tx_sclk, negedge rst_ahb_n) begin
    if(!rst_ahb_n)
        de_o <= 0;
    else
        de_o <= de_i_r_sclk[3];
end

//rgb565
assign pixel_r = {emb_rdata_r[15:11],3'b0};
assign pixel_g = {emb_rdata_r[10:5],2'b0};
assign pixel_b = {emb_rdata_r[4:0],3'b0};

endmodule


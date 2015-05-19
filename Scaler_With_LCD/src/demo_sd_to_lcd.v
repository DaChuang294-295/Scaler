
//yyzhang@capital-micro.com
module demo_sd_to_lcd(
    clk_i,
    rstn_i,
    display_sel,
    spi_ssn,
    spi_sck,
    spi_mosi,
    spi_miso,
    clk_out_p,
    clk_out_n,
    tx_out_p,
    tx_out_n,
	buttonIn2,
	buttonIn3,
	buttonIn4
);

input clk_i;
input rstn_i;
input display_sel;
output spi_ssn;
output spi_sck;
output spi_mosi;
input  spi_miso;
output clk_out_p;
output clk_out_n;
output [3:0] tx_out_p;
output [3:0] tx_out_n;
input buttonIn2;
input buttonIn3;
input buttonIn4;

wire clk_200M;
wire clk_150M;
wire locked;
wire          m_ahb_mastlock;
wire [3:0]    m_ahb_prot;
wire [2:0]    m_ahb_size;
wire [31:0]   m_ahb_addr;
wire          m_ahb_write;
wire [2:0]    m_ahb_burst;
wire [1:0]    m_ahb_trans;
wire [31:0]   m_ahb_wdata;
wire          m_ahb_ready;
wire          m_ahb_resp;
wire [31:0]   m_ahb_rdata;

wire tx_sclk;
wire de;
wire h_valid;
wire v_valid;
wire [7:0] pixel_r;
wire [7:0] pixel_g;
wire [7:0] pixel_b;

wire [6:0] tx_out_0;
wire [6:0] tx_out_1;
wire [6:0] tx_out_2;
wire [6:0] tx_out_3;
wire [27:0] tx_out;
wire [31:0] gpio_out;

reg rstn_final;
wire rstn_final_tmp;

assign rstn_final_tmp = locked && rstn_i;
always@(posedge tx_sclk, negedge rstn_final_tmp) begin
    if(!rstn_final_tmp)
        rstn_final <= 0;
    else
        rstn_final <= 1;
end

//
pll_v1 u_pll(
    .clkin0     (clk_i      ),//20MHz
    .clkout0    (clk_200M   ),//200MHz
    .clkout1    (clk_150M   ),//150MHz
    .locked     (locked     )
);
//arm
mcu_armcm3 u_arm(
    .fp2soc_rst_n   (rstn_final),
    .fp_clk_sys     (clk_200M  ),
    .fp_clk_arm     (clk_200M  ),
    .fp_clk_ddrc    (clk_200M  ),
    .spi0_mosi      (spi_mosi  ),
    .spi0_sck       (spi_sck   ),
    .spi0_ssn       (spi_ssn   ),
    .spi0_miso      (spi_miso  ),
    .gpio_0_out_o   (gpio_out  ),
    .clk_ahb_fp0        (clk_150M       ),
    .rst_ahb_fp0_n      (rstn_final     ),
    .fp0_m_ahb_mastlock (m_ahb_mastlock ),
    .fp0_m_ahb_prot     (m_ahb_prot     ),
    .fp0_m_ahb_size     (m_ahb_size     ),
    .fp0_m_ahb_addr     (m_ahb_addr     ),
    .fp0_m_ahb_write    (m_ahb_write    ),
    .fp0_m_ahb_burst    (m_ahb_burst    ),
    .fp0_m_ahb_trans    (m_ahb_trans    ),
    .fp0_m_ahb_wdata    (m_ahb_wdata    ),
    .fp0_m_ahb_ready    (m_ahb_ready    ),
    .fp0_m_ahb_resp     (m_ahb_resp     ),
    .fp0_m_ahb_rdata    (m_ahb_rdata    )
);
//LCD DISPLAY CONTRL
colorbar_gen u_colorgen(
    .clk    (tx_sclk    ),
    .rstn   (rstn_final ),
    .h_valid(h_valid    ),
    .v_valid(v_valid    )
);
//BUFFR+FP MASTER
sdram_to_RGB u_sdram_to_RGB(
    //To ahb master, access DDRC
    .clk_ahb        (clk_150M       ),
    .rst_ahb_n      (rstn_final     ),
    .m_ahb_mastlock (m_ahb_mastlock ),
    .m_ahb_prot     (m_ahb_prot     ),
    .m_ahb_size     (m_ahb_size     ),
    .m_ahb_addr     (m_ahb_addr     ),
    .m_ahb_write    (m_ahb_write    ),
    .m_ahb_burst    (m_ahb_burst    ),
    .m_ahb_trans    (m_ahb_trans    ),
    .m_ahb_wdata    (m_ahb_wdata    ),
    .m_ahb_ready    (m_ahb_ready    ),
    .m_ahb_resp     (m_ahb_resp     ),
    .m_ahb_rdata    (m_ahb_rdata    ),

    //start load signal
    .display_sel    (display_sel),
    .gpio_out       (gpio_out   ),
	
	//button change mode
	.buttonIn2(buttonIn2),
	.buttonIn3(buttonIn3),
	.buttonIn4(buttonIn4),
	
    //To LCD driving
    .tx_sclk    (tx_sclk),
    .h_valid    (h_valid),
    .v_valid    (v_valid),
    .de_o       (de     ),
    .pixel_r    (pixel_r),
    .pixel_g    (pixel_g),
    .pixel_b    (pixel_b)
);

assign tx_out_0 = {pixel_r[0], pixel_r[1],pixel_r[2],pixel_r[3],pixel_r[4],pixel_r[5],pixel_g[0]};
assign tx_out_1 = {pixel_g[1], pixel_g[2],pixel_g[3],pixel_g[4],pixel_g[5],pixel_b[0],pixel_b[1]};
assign tx_out_2 = {pixel_b[2],pixel_b[3],pixel_b[4],pixel_b[5],2'b0, de};
assign tx_out_3 = {pixel_r[6],pixel_r[7],pixel_g[6],pixel_g[7],pixel_b[6],pixel_b[7],1'b0};

assign tx_out = {tx_out_3, tx_out_2, tx_out_1, tx_out_0};

lvds_tx_v1 u_lvds(
    .clk                (clk_i      ),
    .rstn               (rstn_final ),
    .clk_out_p          (clk_out_p  ),
    .clk_out_n          (clk_out_n  ),
    .tx_out_p           (tx_out_p   ),
    .tx_out_n           (tx_out_n   ),
    .tx_sclk            (tx_sclk    ),
    .tx_out             (tx_out     ),
    .tx_data_align_rstn (rstn_final )
);

endmodule

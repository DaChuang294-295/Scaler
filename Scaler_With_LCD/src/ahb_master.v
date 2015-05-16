module ahb_master (
                   // Inputs from the AHB.
                         hclk_i,
                         hreset_n,
                         hready_i,
                         hresp_i,
                         hrdata_i,
                         // Outputs to the AHB.
                         haddr_o,
                         htrans_o,
                         hwrite_o,
                         hsize_o,
                         hburst_o,
                         hwdata_o,
                         // Inputs from the DMA.
                         dma_start_xfer,
                         dma_addr,
                         dma_rd_wrn,
                         dma_burst_count,
                         dma_fixed_burst,
                         dma_wdata,
                         dma_eof,
                         // Outputs to the DMA.
                         ahm_rdata,
                         ahm_rdata_push,
                         ahm_wdata_pop,
                         ahm_xfer_done,
                         ahm_error
                         );
// Inputs from the AHB.
input                    hclk_i;          // AHB Master clock
input                    hreset_n;        // AHB Master Reset

input                    hready_i;        // Ready signal from AHB bus 
input                    hresp_i;         // Response from the slave during data transfer
input [31:0]   hrdata_i;                 // Read data from AHB Slave of

// Outputs to the AHB.
output [31:0]            haddr_o;         // Address during transaction
output [1:0]             htrans_o;        // AHB Transfer type from the Master 
output                   hwrite_o;        // When high indicates a write operation
output [2:0]             hsize_o;         // Indicates the size of the tranfer.
                                          // Values supported are 32/64/128bit transfers only
output [2:0]             hburst_o;        // Indicate the AHB Burst type 
                                          // Supported values are SINGLE, INCR, INCR4/8/16
output [31:0]  hwdata_o;                  // Write data from the AHB master 

// Inputs from the DMA.
input                    dma_start_xfer;  // Start transfer request from DMA module. It
                                          // should be 'high pulse to request start of
                                          // AHB transaction. This signal validates
                                          // dma_addr, dma_rd_wrn, dma_burst_count,
                                          // dma_xfer_size and dma_fixed_burst signals.

input [31:0]             dma_addr;        // Start Address of the AHB transfer.
                                          // Need not be updated during burst transfers

input                    dma_rd_wrn;      // Indication of read(`H) or write (`L)operation.
                                          // Should not change the transaction is completed

input [7:0]              dma_burst_count; // Number of data Beats in current Burst 
                                          // Varies from all-0 = 1 beat to
                                          //             all-1 = 256 beats


input [31:0]             dma_wdata;       // Write data from the DMA 
input                    dma_eof;         // End of frame tranfer to the Host indication
                                          // during burst write transfers. It is used to
                                          // indicate premature end to requested burst-size.

input                    dma_fixed_burst; // Indicates transfer-type to be used during burst
                                          // 1 - use fixed-bursts (INCR4/8/16); 0 = use INCR

// Outputs to the DMA 

output                   ahm_wdata_pop;   // use to indicate acceptance of data for write transfer
                                          // DMA should put the next data at the end of this clock cycle
output [31:0]            ahm_rdata;       // Read data to the DMA 
output                   ahm_rdata_push;  // indicates valid data on ahm_rdata. DMA should accept it
                                          // immediately.

output                   ahm_xfer_done;   // Transfer done indication from AHB Master. The DMA can
                                          // only then start another transfer by asserting dma_start_xfer

output                   ahm_error;       // The current AHB transaction resulted in an ERROR
                                          // response from the AHB slave. Asserted along with
                                          // ahm_xfer_done





//                       _ _     _ _     _ _     _ _                
//                      |   |   |   |   |   |   |   |
// hclk_i            _ _|   |_ _|   |_ _|   |_ _|   |_ _             
//                      
//                       _ _ _ _       
//                      |       |
//ahm_wdata_pop      _ _|       |_ _ _ _ _ _ _ _ _ _ _   
//
//                               _ _ _  
//                             \/     \/\\\\
//dma_wdata                    /\_ _ _/\ \\\\  
//                                
//                       _ _ _ _       
//                      |       |
//ahm_rdata_push     _ _|       |_ _ _ _ _ _ _ _ _ _ _   
//
//                       _ _ _  
//                     \/     \/\\\\
//ahm_rdata            /\_ _ _/\ \\\\  
//                                
//
//
//
//                                       _ _ _ _       
//                                      |       |
//ahm_xfer_done                      _ _|       |_ _ _ _ _ _ _ _ _ _ _   
//
//
//                                       _ _ _ _       
//                                      |       |
//ahm_error                          _ _|       |_ _ _ _ _ _ _ _ _ _ _   
//
`define RST posedge hclk_i or negedge hreset_n
parameter DMA_IDLE  = 2'b00;
parameter DMA_START = 2'b01;
parameter DMA_CHK   = 2'b10;

parameter AHB_IDLE  = 3'b000;
parameter AHB_REQ   = 3'b001;
parameter AHB_START = 3'b010;
parameter AHB_XFER  = 3'b011;
parameter AHB_DONE  = 3'b100;
parameter AHB_ERR   = 3'b101;

parameter TRANS_IDLE   = 2'b00;
parameter TRANS_BUSY   = 2'b01;
parameter TRANS_NONSEQ = 2'b10;
parameter TRANS_SEQ    = 2'b11;

parameter SINGLE = 3'b000;
parameter INCR = 3'b001;
parameter INCR4 = 3'b011;
parameter INCR8 = 3'b101;
parameter INCR16 = 3'b111;

reg hwrite_o;
reg [1:0] htrans_o;
reg [2:0] hburst_o;

wire [2:0] hsize_o;
assign hsize_o = 3'b010;

reg ahm_error;
reg ahm_xfer_done;
reg [31:0] hwdata_o;
reg ahm_rdata_push;

wire [31:0] haddr_o;
wire ahm_wdata_pop;
wire [31:0] ahm_rdata;

reg [1:0] dma_cs;
reg [1:0] dma_ns;

reg [2:0] ahb_cs;
reg [2:0] ahb_ns;

//reg [8:0] addr_count;
reg [7:0] addr_count;

reg [7:0] xfer_count;
reg [7:0] burst_size; 

reg [31:0] wdata_in_r;
reg [31:0] ahm_rdata_r;

reg [31:2] mx_addr; // just for 32 bit bus width 
reg [7:0] haddr_lo;
reg [21:0] haddr_hi;

reg wdata_sle;
reg wdata_pop;
reg prefetch_wdata_pop;
reg dma_eof_get;
reg mx_done_r;

wire mx_start;
wire resp_ok;
wire premature_end;
wire mx_done;
wire ld_retry_cmd;
wire load_mx_addr;

wire incr_mx_addr;
wire tnf_finish;
wire [7:0] lessbrstsize;
//wire [8:0] beat_size;
//wire [8:0] xfer_count_temp;
wire [7:0] beat_size;
wire [7:0] xfer_count_temp;

wire rdata_get;
wire wdata_d1_get;
wire hready_del;
wire wdata_ahm_get;

wire [31:0] rdata_in;
wire [31:0] wdata_in;
wire [31:0] wdata_out;

reg wdata_sel;

// DMA FSM

always @ (`RST)
 if (!hreset_n) 
   dma_cs <= DMA_IDLE;
 else 
   dma_cs <= dma_ns;

always @ (*)
  case (dma_cs) 
   DMA_IDLE  : begin 
                if (dma_start_xfer)
                   dma_ns = DMA_START;
                else 
                   dma_ns = DMA_IDLE;
               end    

   DMA_START : begin 
                if (mx_done & (ahb_cs==AHB_ERR)) 
                  dma_ns = DMA_IDLE;
                else if (mx_done)
                  dma_ns = DMA_CHK;
                else 
                  dma_ns = DMA_START;
               end
   DMA_CHK   : begin 
                 if (tnf_finish | dma_eof_get)
                  dma_ns = DMA_IDLE;
                 else 
                  dma_ns = DMA_START;
               end
   default:       dma_ns = DMA_IDLE;
  endcase 

assign mx_start = ((dma_cs == DMA_IDLE) | dma_cs ==(DMA_CHK)) & (dma_ns == DMA_START) ;

// AHB FSM

always @ (`RST)
  if (!hreset_n) 
    ahb_cs <= AHB_IDLE;
  else 
    ahb_cs <= ahb_ns;

always @ (`RST)
  if (!hreset_n) 
    ahm_xfer_done <= 1'b0;
  else if ((mx_done_r & (ahb_cs==AHB_IDLE) & dma_rd_wrn) |
           (mx_done & ahb_ns==(AHB_IDLE)) & (~dma_rd_wrn))
    ahm_xfer_done <= 1'b1;
  else 
    ahm_xfer_done <=1'b0;

assign resp_ok = hready_i & (!hresp_i);
assign premature_end = ((dma_eof & (!wdata_sel)) | dma_eof_get) & (!dma_fixed_burst) & (!dma_rd_wrn);

always @ (*)
  case (ahb_cs)
    AHB_IDLE  : begin
                  if (mx_start)
                    ahb_ns = AHB_REQ;
                  else 
                    ahb_ns = AHB_IDLE; 
                end
    AHB_REQ   : begin 
                  if (hready_i) 
                    ahb_ns = AHB_START;
                  else 
                    ahb_ns = AHB_REQ;
                end
    AHB_START : begin  
                  if (addr_count==8'h1 & hready_i)
                    ahb_ns = AHB_DONE;
                  else if (addr_count!=8'h1 & hready_i)
                    ahb_ns = AHB_XFER;
                  else 
                    ahb_ns = AHB_START;
                end
    AHB_XFER  : begin 
                  if (hresp_i)
                    ahb_ns = AHB_ERR;
                  else if (((addr_count == 8'h1 ) | premature_end) & resp_ok)
                    ahb_ns = AHB_DONE;
                  else 
                    ahb_ns = AHB_XFER;
                end
    AHB_DONE  : begin 
                  if (hresp_i)
                    ahb_ns = AHB_ERR;
                  else if (resp_ok & (!dma_eof_get) & (xfer_count != burst_size)) 
                    ahb_ns = AHB_REQ;
                  else if (resp_ok)
                    ahb_ns = AHB_IDLE;
                  else 
                    ahb_ns = AHB_DONE;  
                end
    AHB_ERR   : begin 
                  if (hready_i)
                    ahb_ns = AHB_IDLE;
                  else 
                    ahb_ns = AHB_ERR;
                end
	default:         ahb_ns = AHB_IDLE;
   endcase 

assign mx_done = ((ahb_cs == AHB_ERR) & hready_i) | ((ahb_cs == AHB_DONE) & resp_ok);
assign load_mx_addr = (ahb_cs == AHB_REQ) & hready_i;
assign incr_mx_addr = ((ahb_cs == AHB_START) & hready_i)|((ahb_cs == AHB_XFER) & resp_ok);
assign tnf_finish = ~|(xfer_count);
assign lessbrstsize = (~mx_addr[9:2] > xfer_count) ? (xfer_count) : (~mx_addr[9:2]); // for cross a 1KB address boundary

always @ (*)
  if (tnf_finish)
    burst_size = 8'h0;
  else if (!dma_fixed_burst)
    burst_size = lessbrstsize;
  else if ((xfer_count >= 8'hf) & ((~mx_addr[9:2]) >= 8'hf))
    burst_size = 8'hf;
  else if ((xfer_count >= 8'h7) & ((~mx_addr[9:2]) >= 8'h7))
    burst_size = 8'h7;
  else if ((xfer_count >= 8'h3) & ((~mx_addr[9:2]) >= 8'h3))
    burst_size = 8'h3;
  else 
    burst_size = 8'h0;

//assign beat_size = {1'b0,burst_size} + 1'b1;  //incr16  incr8 and incr4 are count from 1 ,so plus one
assign beat_size = burst_size ;  // to avoid use substract, use invert code to express negative
                                 // when convert to complement, it should be invert each bit ,then plus one  
                                 // invert code less than complement , so not plus one , to void substract one

//assign xfer_count_temp = {1'b0,xfer_count} - beat_size; 
assign xfer_count_temp = xfer_count + (~beat_size);

always @ (`RST)
  if (!hreset_n) 
    xfer_count <= 8'h0;
  else if (dma_start_xfer & dma_eof & !dma_rd_wrn)
    xfer_count <= 8'h0;
  else if (dma_start_xfer)
    xfer_count <= dma_burst_count;
  else if ((mx_done & (xfer_count!=0)) & (xfer_count == burst_size))
    xfer_count <= 8'h0;
  else if (mx_done & xfer_count != 0)
    xfer_count <= xfer_count_temp[7:0];

always @ (`RST) 
  if (!hreset_n) 
    mx_addr <= 30'h0;
  else if (dma_start_xfer)
    mx_addr <= dma_addr[31:2];
  else if (mx_done)
    mx_addr <= haddr_o[31:2];

always @ (`RST)
  if (!hreset_n) 
    addr_count <= 8'h0;
  else if (load_mx_addr)
    //addr_count <= beat_size ;
    addr_count <= (beat_size + 1'b1);//incr16  incr8 and incr4 are count from 1 ,so plus one
  else if (incr_mx_addr)
    //addr_count <= addr_count - 1'b1; // avoid use subs
    addr_count <= addr_count + 8'hff;   // subtract 1 as plus 8'hFF

always @ (`RST) 
   if (!hreset_n)
     mx_done_r <= 1'b0;
   else 
     mx_done_r <= mx_done;
always @ (`RST)
   if (!hreset_n)
    ahm_error <= 1'b0;
   else if (ahb_cs == AHB_ERR)
    ahm_error <= hready_i;
   else 
    ahm_error <= 1'b0;





always @ (`RST)
  if (!hreset_n) 
    haddr_lo <=8'h0;
  else if (load_mx_addr)
    haddr_lo <= mx_addr[9:2];
  else if (incr_mx_addr)
    haddr_lo <= haddr_lo + 1'b1;
  
always @ (`RST) 
  if (!hreset_n) 
    haddr_hi <= 22'h0;
  else if (load_mx_addr)
    haddr_hi <= mx_addr[31:10];
  else if (incr_mx_addr & (&haddr_lo))
    haddr_hi <= haddr_hi + 1'b1;

assign haddr_o[31:0] = {haddr_hi,haddr_lo,2'b00};

always @ (`RST)
  if (!hreset_n)
    hwrite_o <= 1'b0;
  else if (dma_start_xfer)
    hwrite_o <= !dma_rd_wrn;

always @ (`RST)
  if (!hreset_n)
    htrans_o <= TRANS_IDLE;
  else if (load_mx_addr)
    htrans_o <= TRANS_NONSEQ;
  else if ((hresp_i & (ahb_cs!=AHB_START)) | //ERROR
           (((ahb_cs== AHB_START) | (ahb_cs == AHB_XFER)) & (ahb_ns == AHB_DONE))) // Last transfer
    htrans_o <= TRANS_IDLE;
  else if ((ahb_cs == AHB_START) & (addr_count > 9'h1) & hready_i)
    htrans_o <= TRANS_SEQ;


always @ (`RST) 
  if (!hreset_n) 
    hburst_o <= 3'b0;
  else if (load_mx_addr & (!dma_fixed_burst)) begin 
    if (burst_size ==8'h0)
      hburst_o <=  SINGLE;
    else 
      hburst_o <= INCR;
  end
  else if (load_mx_addr & dma_fixed_burst) begin
    case (burst_size)
      8'h3 : hburst_o <= INCR4;    
      8'h7 : hburst_o <= INCR8;    
      8'hf : hburst_o <= INCR16;
      default : hburst_o <= SINGLE;
    endcase
  end    
  
assign rdata_get = ((ahb_cs == AHB_DONE) | (ahb_cs==AHB_XFER)) & resp_ok & dma_rd_wrn;
assign hready_del = (ahb_cs == AHB_XFER) & (!hready_i) & ahm_wdata_pop;
assign wdata_d1_get = ((ahb_cs == AHB_XFER) | (ahb_cs == AHB_DONE) & hready_del) & (!wdata_sel);
assign wdata_ahm_get = (((ahb_cs == AHB_START)&hready_i) | 
                        (((ahb_cs == AHB_XFER) | (ahb_cs == AHB_DONE)) & (ahb_ns !=AHB_IDLE) & resp_ok))
                       & (!dma_rd_wrn);
assign ahm_wdata_pop = !dma_eof_get & wdata_pop;


always @ (`RST)
  if (!hreset_n) 
    dma_eof_get <= 1'b0;
  else if (dma_eof & wdata_pop & (~dma_eof_get))
    dma_eof_get <= 1'b1;
  else if (dma_cs == DMA_IDLE)
    dma_eof_get <= 1'b0;

always @ (`RST) 
  if (!hreset_n) 
    wdata_sel <= 1'b0;
  else if (hready_del)
    wdata_sel <= 1'b1;
  else if ((ahb_cs == AHB_IDLE) |(((ahb_cs == AHB_XFER) | (ahb_cs == AHB_DONE)) & resp_ok))
    wdata_sel <= 1'b0;

// first transfer
always @ (`RST)
  if (!hreset_n) 
    prefetch_wdata_pop  <= 1'b0;
  else if (ahb_cs == AHB_IDLE)
    prefetch_wdata_pop <= 1'b0;
  else if (load_mx_addr & !dma_rd_wrn)
    prefetch_wdata_pop <= 1'b1;

always @ (`RST)
  if (!hreset_n)
    wdata_pop <= 1'b0;
  else if (load_mx_addr & (!dma_rd_wrn) & (!prefetch_wdata_pop))
    wdata_pop <= 1'b1;
  else 
    wdata_pop <= ((xfer_count != 0) & (wdata_ahm_get & (addr_count != 9'h1))) | 
                 ((ahb_cs == AHB_DONE) & resp_ok & !dma_rd_wrn & (ahb_ns != AHB_IDLE));

always @ (`RST)
  if (!hreset_n) 
    ahm_rdata_push <= 1'b0;
  else 
    ahm_rdata_push <= rdata_get;


assign rdata_in = hrdata_i;
assign wdata_in = dma_wdata;


always @ (`RST)
  if (!hreset_n) 
    ahm_rdata_r  <= 32'b0;
  else if (rdata_get)
    ahm_rdata_r <= rdata_in;

assign ahm_rdata = ahm_rdata_r;

always @ (`RST)
  if (!hreset_n) 
    wdata_in_r <= 32'b0;
  else if (wdata_d1_get & (!dma_rd_wrn))
    wdata_in_r <= wdata_in;

assign wdata_out = wdata_sel ? wdata_in_r : wdata_in;

always @ (`RST) 
  if (!hreset_n) 
    hwdata_o <= 32'b0;
  else if (((wdata_ahm_get & (ahb_cs != AHB_START)) | 
            (wdata_pop & (ahb_cs == AHB_START))) & (!dma_rd_wrn))

    hwdata_o <= wdata_out;


endmodule







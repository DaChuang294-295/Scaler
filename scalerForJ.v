/*
待填充的顶层
*/ 

module scalerForJ#(
	parameter INPUT_RES_WIDTH = 11,
	parameter SCALE_FRAC_WIDTH=6,
	parameter SCALE_INT_WIDTH=2,
	parameter SCALE_BITS = SCALE_INT_WIDTH+SCALE_FRAC_WIDTH,
	parameter DATA_WIDTH = 16,
	parameter RAM_ADDR_WIDTH =11,
	parameter OUTPUT_RES_WIDTH = 11
	)(
	input wire				I_inclk,
	input wire				I_outclk,
	input wire				I_rstn,
	input wire				I_hsync,
	input wire				I_vsync,
	input wire				I_dat_vld,
	input wire				I_dat,
	output wire				o_hsync,
	output wire				o_vsync,
	output wire				o_dat_vld,
	output wire				o_data	
	);
	
scaler #(
	.INPUT_RES_WIDTH(INPUT_RES_WIDTH),
	.SCALE_FRAC_WDITH(SCALE_FRAC_WDITH),
	.SCALE_INT_WIDTH(SCALE_INT_WIDTH),
	.DATA_WIDTH(DATA_WIDTH),
	.OUTPUT_RES_WIDTH(OUTPUT_RES_WIDTH),
	.RAM_ADDR_WIDTH(RAM_ADDR_WIDTH)
	)scaler_inst(
   //外部输入
    .clka(I_inclk),
	.clkb(I_outclk),
	.rst(!I_rstn),
	.iHsyn(I_hsync),
	.iVsyn(I_vsync),
	.en(I_dat_vld), 
	.dIn(I_dat), 
	.dInEn(I_dat_vld), 
	.dOut(o_data), 
	.dOutEn(o_dat_vld), 
	.HS(o_hsync), 
	.VS(o_vsync), 
	//京微雅格公司开发人员请补充这里

	.xBgn(？), //如需输入一整帧，此项填0
	.xEnd(？), //如需输入一整帧，此项填inXRes-1 如720*1280，填719
	.yBgn(？), //如需输入一整帧，此项填0
	.yEnd(？), //如需输入一整帧，此项填inYRes-1 如720*1280，填1279
	.inYRes(？), //输入列分辨率 如720*1280，填1280
	.inXRes(？), //输入列分辨率 如720*1280，填729
	.outYRes(？), //输出分辨率
	.outXRes(？)//输出分辨率
	);
endmodule
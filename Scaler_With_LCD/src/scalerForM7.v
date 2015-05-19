module scalerForM7#(
	parameter INPUT_RES_WIDTH = 11,
	parameter SCALE_FRAC_WIDTH=6,
	parameter SCALE_INT_WIDTH=2,
	parameter SCALE_BITS = SCALE_INT_WIDTH+SCALE_FRAC_WIDTH,
	parameter DATA_WIDTH = 16,
	parameter RAM_ADDR_WIDTH =11,
	parameter OUTPUT_RES_WIDTH = 11
	)(
	input wire 								clka,		//输入时钟
	input wire								clkb,		//输出时钟
	input wire 								rst,
	input wire								en,			//coefCal的使能
	input wire								iHsyn,		//输入行同步
	input wire								iVsyn,		//输入场同步
	
	//视频信号
	input wire	[DATA_WIDTH-1:0]   			dIn,		//输入像素
	input wire  							dInEn,		//数据输入使能
	output wire [DATA_WIDTH-1:0]   			dOut,		//每个输出像素的数值
	output wire 							dOutEn,		//数据输出使能
	output wire 							HS,				//行同步信号，上升沿代表即将输出新的一行
	output wire								VS,				//场同步信号，上升沿代表即将输出新的一帧
	
	//button change
	input wire								button2,
	input wire								button3,
	input wire								button4
	);
	
		
	//参数设置
	reg	[INPUT_RES_WIDTH-1:0] 		xBgn = 0;		//输入信号的起始左边界减1，在此边界左边的像素点不会被输入
	reg	[INPUT_RES_WIDTH-1:0] 		xEnd = 1024-1;	//输入信号的结束右边界减1，在此边界右边的像素点不会被输入
	reg	[INPUT_RES_WIDTH-1:0]		yBgn = 0;		//输入信号的起始上边界减1，在此边界上边的像素点不会被输入
	reg	[INPUT_RES_WIDTH-1:0]		yEnd = 768-1;	//输入信号的结束下边界减1，在此边界下边的像素点不会被输入
	reg	[INPUT_RES_WIDTH-1:0] 		inXRes = 1024;	//X输入分辨率
	reg	[INPUT_RES_WIDTH-1:0] 		inYRes = 768;	//Y输入分辨率
	reg	[OUTPUT_RES_WIDTH:0] 		outXRes = 1024;	//X输出分辨率
	reg	[OUTPUT_RES_WIDTH:0] 		outYRes	= 768;	//Y输出分辨率
	
	always @(posedge rst, posedge button2, posedge button3, posedge button4) begin
		if(rst) begin
			xEnd <= 1024-1;
			yEnd <= 768-1;
			outXRes <= 1024;
			outYRes <= 768;
		end
		else if(button2) begin
			xEnd <= 768-1;
			yEnd <= 768-1;
			outXRes <= 1024;
			outYRes <= 768;
		end
		else if(button3) begin
			xEnd <= 512-1;
			yEnd <= 768-1;
			outXRes <= 1024;
			outYRes <= 768;
		end	
		else if(button4) begin
			xEnd <= 1024-1;
			yEnd <= 768-1;
			outXRes <= 512;
			outYRes <= 384;
		end
	end
	
	scaler  #(
	.DATA_WIDTH(DATA_WIDTH)
	)uut(
		.clka(clka),
		.clkb(clkb),
		.rst(rst),
		.iHsyn(iHsyn),
		.iVsyn(iVsyn),
		.en(en), 
		.dIn(dIn), 
		.dInEn(dInEn), 
		.dOut(dOut), 
		.dOutEn(dOutEn), 
		.HS(HS), 
		.VS(VS), 
		.xBgn(xBgn), 
		.xEnd(xEnd), 
		.yBgn(yBgn), 
		.yEnd(yEnd), 
		.inYRes(inYRes), 
		.inXRes(inXRes), 
		.outYRes(outYRes), 
		.outXRes(outXRes)
	);
endmodule
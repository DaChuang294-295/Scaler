/*
功能：顶层模块
作者: 陈天翼 林竞豪 林翰 郭思滢 张惠迪
版本: 1.0
最后修改日期：2014/4/19
*/ 

module scaler#(
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
	
	//参数设置
	input wire	[INPUT_RES_WIDTH-1:0] 		xBgn,		//输入信号的起始左边界减1，在此边界左边的像素点不会被输入
	input wire	[INPUT_RES_WIDTH-1:0] 		xEnd,		//输入信号的结束右边界减1，在此边界右边的像素点不会被输入
	input wire	[INPUT_RES_WIDTH-1:0]		yBgn,		//输入信号的起始上边界减1，在此边界上边的像素点不会被输入
	input wire	[INPUT_RES_WIDTH-1:0]		yEnd,		//输入信号的结束下边界减1，在此边界下边的像素点不会被输入
	input wire	[INPUT_RES_WIDTH-1:0] 		inYRes,		//X输入分辨率
	input wire	[INPUT_RES_WIDTH-1:0] 		inXRes,		//Y输入分辨率
	input wire	[OUTPUT_RES_WIDTH:0] 	outYRes,		//X输出分辨率
	input wire	[OUTPUT_RES_WIDTH:0] 	outXRes		//Y输出分辨率
	//前一级输入使能；
	//to sdram_to_RGB
	output wire 							v_valid;	//vertical valid signal
	output wire								h_valid;	//horizontal valid signal
	);
	
	wire [SCALE_BITS-1:0]					kX;			//水平方向放大倍数的倒数
	wire [SCALE_BITS-1:0]					kY;			//垂直方向放大倍数的倒数
	wire									inEn;		//允许inputCtrl进行输入
	wire [RAM_ADDR_WIDTH-1:0]				ramWrtAddr;	//RAM的写入地址
	wire									ramWrtEn;	//RAM的写入使能
	wire [DATA_WIDTH-1:0]					ramData;	//输入RAM像素点的值
	wire [RAM_ADDR_WIDTH-1:0]				ramRdAddr00;	
	wire [RAM_ADDR_WIDTH-1:0]				ramRdAddr01;
	wire [RAM_ADDR_WIDTH-1:0]				ramRdAddr10;	
	wire [RAM_ADDR_WIDTH-1:0]				ramRdAddr11;
	wire [DATA_WIDTH-1:0]			ramData00;	//输出RAM像素点的值
	wire [DATA_WIDTH-1:0]			ramData01;	//输出RAM像素点的值
	wire [DATA_WIDTH-1:0]			ramData10;	//输出RAM像素点的值
	wire [DATA_WIDTH-1:0]			ramData11;	//输出RAM像素点的值
	wire 							jmp1;	//读取指针移动一位
	wire							jmp2;	//读取指针移动两位
	wire [2:0]  					fifoNum;
	wire							jmp;	
	
coefCal #(
	.INPUT_RES_WIDTH(INPUT_RES_WIDTH),
	.OUTPUT_RES_WIDTH(OUTPUT_RES_WIDTH),
	.SCALE_BITS(SCALE_BITS)
	)coefcal1(
   //外部输入
   .clk(clka),
   .rst(rst),
   .en(en),
   .xBgn(xBgn),
   .xEnd(xEnd),
   .yBgn(yBgn),
   .yEnd(yEnd),
   .inXRes(inXRes),
   .inYRes(inYRes),
   .outXRes(outXRes),
   .outYRes(outYRes),
   .iVsyn(iVsyn),
   //输出到Cal和inputCtrl
   .kX(kX),
   .kY(kY),
   //输出到inputCtrl
   .inEn(inEn)
   );

inputCtrl #(
	.DATA_WIDTH(DATA_WIDTH),		//输入的数据
	.INPUT_RES_WIDTH(INPUT_RES_WIDTH),	//输入分辨率地址位宽
	.SCALE_FRAC_WIDTH(SCALE_FRAC_WIDTH),	//kY每次增加的值的小数部分位宽
	.SCALE_INT_WIDTH(SCALE_INT_WIDTH),	//kY每次增加的值的整数部分位宽
	.ADDRESS_WIDTH(RAM_ADDR_WIDTH)//RAM的数据位宽
	)inputctrl1(
	//外部输入的时钟与重置
	.clk(clka),
	.rst(rst),
	.iHsyn(iHsyn),			//行同步信号
	.iVsyn(iVsyn),			//场同步信号
	.dIn(dIn),
	.inXRes(inXRes),
	.xBgn(xBgn),
	.xEnd(xEnd),
	.yBgn(yBgn),
	.yEnd(yEnd),
	.dInEn(dInEn),
	//input from coefCal
	.fifoNum(fifoNum),
	//由coefCal输入
	.En(inEn),
	.kX(kX),
	.kY(kY),
	//输出到RAM
	.ramWrtAddr(ramWrtAddr),
	.ramWrtEn(ramWrtEn),
	.dataOut(ramData),
	.jmp(jmp),
	//output to sdram_to_RGB
	.v_valid(v_valid),
	.h_valid(h_valid)
	);

ramFifo #(
	.DATA_WIDTH(DATA_WIDTH),
	.ADDRESS_WIDTH(RAM_ADDR_WIDTH)
)fifo1(
	.clka(clka),
	.clkb(clkb),
	.rst(rst),
	.advanceRead1(jmp1),	//读取指针移动一位
	.advanceRead2(jmp2),	//读取指针移动两位
	.advanceWrite(jmp),	//写入指针移动一位

	.writeData(ramData),		//写入的数据
	.writeAddress(ramWrtAddr),	//将被写入的RAM的地址
	.writeEnable(ramWrtEn),	//写入使能
	.fillCount(fifoNum),		//完成写入的剩余RAM

	.readData00(ramData00),		//从最深处的RAM读取位于readAddress的数据
	.readData01(ramData01),		//从最深处的RAM读取位于（readAddress+1）的数据
	.readData10(ramData10),		//从第二深处的RAM读取位于readAddress的数据
	.readData11(ramData11),		//从第二深处的RAM读取位于（readAddress+1）的数据
	.readAddress00(ramRdAddr00),
	.readAddress01(ramRdAddr01),
	.readAddress10(ramRdAddr10),
	.readAddress11(ramRdAddr11)
);

Cal # (
	.DATA_WIDTH(DATA_WIDTH),
	.ADDRESS_WIDTH(RAM_ADDR_WIDTH),
	.SCALE_INT_WIDTH(SCALE_INT_WIDTH),
	.SCALE_FRAC_WIDTH(SCALE_FRAC_WIDTH),
	.INPUT_RES_WIDTH(INPUT_RES_WIDTH),
	.OUTPUT_RES_WIDTH(OUTPUT_RES_WIDTH)
	)cal1
(   //输入
    .clk(clkb),
	.rst(rst),
	//来自inputCtrl
	.ramAddrIn(ramData),
	//来自RAMFIFO
	.ramData00(ramData00),
	.ramData01(ramData01),
	.ramData10(ramData10),
	.ramData11(ramData11),//从ram里读取的数据值
	.fifoNum(fifoNum),			//FIFO中剩余的行数
	//来自coefCal
	.kX(kX),
	.kY(kY),				//横纵放大倍数的倒数
	.inXNum(xEnd-xBgn),				//输入列数（xBgn-xEnd）
	.inYNum(xEnd-xBgn),				//输入行数（yBgn-yEnd)
    .outXRes(outXRes),			//告知输出列数
	.outYRes(outYRes),			//告知输出行数
	//输出
	//输出至下一级
	.HS(HS),				//输出行同步信号
	.VS(VS),				//输出场同步信号
	.dOutEn(dOutEn),			//输出点同步信号
	//连接至ramFIFO
	.jmp1(jmp1),
	.jmp2(jmp2),		//输出至ramfifo
	.ramRdAddr00(ramRdAddr00),
	.ramRdAddr01(ramRdAddr01),
	.ramRdAddr10(ramRdAddr10),
	.ramRdAddr11(ramRdAddr11),//读取ram的地址
    .dOut(dOut)					//每个输出像素的数值
);
endmodule
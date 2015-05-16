//`timescale 1ns/1ps;
module Cal_tb; // declare testbench name
	
	//可修改参数
	parameter DATA_WIDTH    = 16;
	parameter ADDRESS_WIDTH = 11;
	parameter NUM_WIDTH     = 8;
	parameter FRACTION_WIDTH= 6;
	parameter BUFFER_SIZE	= 2;
	//不可修改参数
	parameter R_WIDTH      	= (DATA_WIDTH==16)?5:(DATA_WIDTH==24)?8:0;
	parameter G_WIDTH      	= (DATA_WIDTH==16)?5:(DATA_WIDTH==24)?8:0;
	parameter B_WIDTH      	= (DATA_WIDTH==16)?5:(DATA_WIDTH==24)?8:0;
	parameter CAL_WIDTH		= ADDRESS_WIDTH + FRACTION_WIDTH;
	parameter KINT_WIDTH	= NUM_WIDTH-FRACTION_WIDTH;
	
   reg clk;
	reg rst;
	//来自inputCtrl
	reg [ADDRESS_WIDTH-1:0]	ramAddrIn;		//inputCtrl写入ram的地址
	//来自RAMFIFO
	reg [DATA_WIDTH-1:0]		ramData00,ramData01,
									ramData10,ramData11;//从ram里读取的数据值
	reg [BUFFER_SIZE-1:0]   	fifoNum;		//FIFO中剩余的行数
	//来自coefCal
	reg [NUM_WIDTH-1:0]    	kX,kY;				//横纵放大倍数的倒数
	reg [ADDRESS_WIDTH-1:0]	inXNum;				//输入列数（xBgn-xEnd）
	reg [ADDRESS_WIDTH-1:0]	inYNum;				//输入行数（yBgn-yEnd)
   reg [ADDRESS_WIDTH-1:0]	outXRes;			//告知输出列数
	reg [ADDRESS_WIDTH-1:0]	outYRes;			//告知输出行数
	
	//输出
	//输出至下一级
	wire HS;				//输出行同步信号
	wire VS;				//输出场同步信号
	wire dOutEn;			//输出点同步信号
	//连接至ramFIFO
	wire jmp1,jmp2;		//输出至ramfifo
   wire [ADDRESS_WIDTH-1:0] ramRdAddr00,ramRdAddr01,
									ramRdAddr10,ramRdAddr11;//读取ram的地址
   wire [DATA_WIDTH-1:0]    dOut		;			//每个输出像素的数值
Cal dut(
   .clk(clk),
   .rst(rst),
	.fifoNum(fifoNum),
   .ramData00(ramData00),
   .ramData01(ramData01),
	.ramData10(ramData10),
   .ramData11(ramData11),
   .kX(kX),
   .kY(kY),
   .outXRes(outXRes),
   .outYRes(outYRes),
	.inXNum(inXNum),
	.inYNum(inYNum),
   .HS(HS),
   .VS(VS),
   .dOutEn(dOutEn),
   .dOut(dOut),
	.ramRdAddr00(ramRdAddr00),
	.ramRdAddr01(ramRdAddr01),
	.ramRdAddr10(ramRdAddr10),
	.ramRdAddr11(ramRdAddr10),
   .ramAddrIn(ramAddrIn),
	.jmp1(jmp1),
	.jmp2(jmp2));

initial 
  begin
     clk = 0;
     forever #10 clk = ~clk;
   end

initial 
   begin// this process block specifies the stimulus.
      rst=1;
	  #30
	  #90
	  ramAddrIn=11'b11111111111;
	  ramData00=13;
      ramData01=25;
		ramData10=13;
      ramData11=25;
	  #100 
      kX=8'b00100000;//0.5
      kY=8'b00100000;//0.5
      outXRes=12;//12
      outYRes=12;//12
	  inXNum=6;
	  inYNum=6;
	  #150 
	  ramData00=1;
	  ramData01=2;
	  ramData10=2;
	  ramData11=2;
	  #300
	  rst=0;
	  fifoNum=1;
   end
endmodule
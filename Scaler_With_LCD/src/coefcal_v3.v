/*
功能：该数据预处理模块使用自行编写的17位除法器进行运算
作者: 林翰
版本: 3.0
最后修改日期：2014/4/17
修改内容：修正除法器精度	加入场同步使能功能
*/ 
 

module coefCal(clk, rst, en, xBgn, xEnd, yBgn, yEnd, inXRes, inYRes, outXRes, outYRes, kX, kY, inEn,iVsyn);

parameter 	INPUT_RES_WIDTH =			11;
parameter 	OUTPUT_RES_WIDTH =		11;
parameter	SCALE_BITS =				8;
//-------------Module IO-----------------------------
//Clock and reset
input wire clk;
input wire rst;   // Asynchronous high level reset

//User interface
//Input
input wire		 en;             // Module enabled
input wire[INPUT_RES_WIDTH-1:0]   xBgn;  //Resolution of input begin left edge data minus 1
input wire[INPUT_RES_WIDTH-1:0]   xEnd;  //Resolution of input end left edge data minus 1
input wire[INPUT_RES_WIDTH-1:0]   yBgn;  //Resolution of input begin up edge data minus 1
input wire[INPUT_RES_WIDTH-1:0]   yEnd;  //Resolution of input end down edge data minus 1
input wire[INPUT_RES_WIDTH-1:0]   inXRes; //Resolution of input horizontal data minus 1
input wire[INPUT_RES_WIDTH-1:0]   inYRes; //Resolution of input vertical data minus 1
input wire[OUTPUT_RES_WIDTH-1:0]  outXRes;//Resolution of output horizontal data minus 1
input wire[OUTPUT_RES_WIDTH-1:0]  outYRes;//Resolution of output vertical data minus 1

//Output
//Output to Cal&inputCtrl
output wire[SCALE_BITS-1:0]  kX;       //Reciprocal of x scaling factors
output wire[SCALE_BITS-1:0]  kY;       //Reciprocal of y scaling factors

//Output to inputCtrl
output reg inEn;                          //Enable to inputCtrl



//使能后，读取输出分辨率（默认输入分辨率合理），判断芯片是否足以支持该速率的放缩：

reg[8:0] frameRate = 'b1100100;
reg[32:0] working = 'b111111110000000000000000000;
reg[32:0] test;
reg work;

always @(posedge clk or posedge rst)
begin
	test = outXRes*(outYRes*frameRate);
	if (rst)
	begin
		inEn <= 1'b0;
		work <= 1'b0;
	end
	if((test)<working)
		work = 1'b1;
	else
		work = 1'b0;
end

always @(posedge clk)
begin
	if(en&work)
		inEn<=1'b1;
end

reg[16:0] xDivisor;
reg[16:0] yDivisor;
reg[16:0] xDividend;
reg[16:0] yDividend;

always @(posedge clk)
begin
	frameRate <= 'b1100100;
	working <= 'b111111110000000000000000000;
	xDivisor <= {6'b0,outXRes};
	yDivisor <= {6'b0,outYRes};
	xDividend <= {xEnd-xBgn+1,6'b0};
	yDividend <= {yEnd-yBgn+1,6'b0};
end



wire[16:0] preKX;
wire[16:0] preKY;

mdivider divide_inst1(
	.reset(rst),
	.divisor(xDivisor),        //输入16位除数
	.dividend(xDividend),       //输入16位被除数
	.ratio(preKX)          //输出16位比率
);

mdivider divide_inst2(
	.reset(rst),
	.divisor(yDivisor),        //输入16位除数
	.dividend(yDividend),       //输入16位被除数
	.ratio(preKY)          //输出16位比率
);

assign kX = preKX[7:0]+1;
assign kY = preKY[7:0]+1;

endmodule

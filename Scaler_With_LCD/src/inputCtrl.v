/*
功能：在数据输入到存储单元前判断该点是否是需要输入的点，仅允许需要输入的点
作者: 陈天翼 郭思滢
版本: 1.1
最后修改日期：2014/4/12
修改内容：取消了行列寄存器复用和边界强制跳点的设计，减少逻辑单元
*/ 
 
module inputCtrl(clk,rst,xBgn,xEnd,yBgn,yEnd,dInEn,dIn,En,kX,kY,ramWrtAddr,ramWrtEn,dataOut,jmp,
				 inXRes,
				 fifoNum,
				 v_valid,h_valid);
//可修改参数
parameter	DATA_WIDTH 		=	24;		//输入的数据位宽
parameter	INPUT_RES_WIDTH	=  	10;		//输入分辨率地址位宽
parameter	SCALE_FRAC_WIDTH =	6;		//放缩倍数每次增加的值的小数部分位宽
parameter 	SCALE_INT_WIDTH	=	2; 		//放缩倍数每次增加的值的整数部分位宽
parameter 	ADDRESS_WIDTH 	=	11;		//RAM的数据位宽
								
//不可修改参数
parameter 	SCALE_WIDTH 	= SCALE_FRAC_WIDTH + SCALE_INT_WIDTH;//防所背书的位宽
parameter	CAL_WIDTH 	= INPUT_RES_WIDTH+SCALE_FRAC_WIDTH; //用以计算该输入哪列时的位宽

//输入 
//外部输入的时钟、重置、参数与数据
input wire 								clk;			//时钟，正边沿触发
input wire								rst;			//异步重置，正边沿触发	
input wire								dInEn;			//像素点同步输入使能
input wire	[INPUT_RES_WIDTH-1:0]		xBgn;			//输入的X的起始边界
input wire	[INPUT_RES_WIDTH-1:0]		xEnd;			//输入的X的结束边界			
input wire	[INPUT_RES_WIDTH-1:0]		yBgn;			//输入的X的起始边界
input wire	[INPUT_RES_WIDTH-1:0]		yEnd;			//输入的X的结束边界
input wire	[DATA_WIDTH-1:0]			dIn;			//当前输入的数据
input wire	[INPUT_RES_WIDTH-1:0]		inXRes;		//input x resolution
//由coefCal输入
input wire 								En;				//允许计算
input wire	[SCALE_WIDTH-1:0]			kY;				//列放缩倍数的倒数
input wire	[SCALE_WIDTH-1:0]			kX;				//放缩倍数的倒数

//input from Ramfifo	
input wire	[2:0]						fifoNum;		//number of FIFO number left

//输出 
//输出到RAM和Cal模块
output reg	[ADDRESS_WIDTH-1:0]		ramWrtAddr;		//RAM的写入地址
//输出到RAM FIFO
output reg								ramWrtEn;		//RAM的写入使能
output reg	[DATA_WIDTH-1:0]			dataOut;		//当前输出的数据,用以避免不必要的数据被读入ram
output reg								jmp;			//告知RAMFIFO一行输入完毕，FIFO指针跳一位
//output to sdram_to_RGB
output reg 								v_valid;
output reg 								h_valid;

//内部信号
//列变量组与行变量组
wire	xBgnEn;											//当前点在截取点右则置高
wire 	yBgnEn;											//当前点在截取点下则置高
wire 	xEndEn;											//当前点在截取点左则置高
wire	yEndEn;											//当前点在截取点右则置高
wire	boundEn;										//点在边界内
wire 	[SCALE_WIDTH-1:0]	coefOneAdd 	=	{2'b01,{(SCALE_FRAC_WIDTH){1'b0}}};		//单位一 用以和放缩的倒数对比，取kY与1中较大的那个
wire	[SCALE_WIDTH-1:0]	xAdder		=	(kX>coefOneAdd&xBgnEn)?kX:coefOneAdd;	//每次列映射坐标累加的步长，取kX与1中较大的那个
wire	[SCALE_WIDTH-1:0]	yAdder 		=	(kY>coefOneAdd&yBgnEn)?kY:coefOneAdd;	//每次行映射坐标累加的步长，
reg		[CAL_WIDTH-1:0]		xCal;													//映射回原图像的x坐标
reg		[CAL_WIDTH-1:0]		yCal;													//映射回原图像的y坐标
wire 	[CAL_WIDTH-1:0]  	xNxtCal		=	xCal+xAdder;							//下一个映射x坐标
wire 	[CAL_WIDTH-1:0]  	yNxtCal		=	yCal+yAdder;							//下一个映射y坐标

//用以切换x和y地址变量（address）的输入与输出
//当前点的输入使能：如果Address=[outCal]，说明进入的点符合输入ram的条件，允许进入
wire 	xThisEn;								
wire	yThisEn;
//前一个点是否符合进入条件，如是，则当前行也可以进入
reg		xPreEn;														//前一列是否允许进入
reg		yPreEn;														//前一行是否允许进入
reg		[INPUT_RES_WIDTH-1:0]	xAddress;							//当前输入给后一级点的x坐标
wire	[INPUT_RES_WIDTH-1:0]	xNxtAddress=xAddress+1;				//下一个输入地址	
reg		[INPUT_RES_WIDTH-1:0]	yAddress;							//当前输入给后一级点的y坐标
wire	[INPUT_RES_WIDTH-1:0]	yNxtAddress=yAddress+1;				//下一个输入地址	

//边界使能，仅当输入的点在边界内时，才允许输入	
assign	xBgnEn=(xAddress>=xBgn)?1'b1:1'b0;
assign 	yBgnEn=(yAddress>=yBgn)?1'b1:1'b0;
assign 	xEndEn=(xAddress<=xEnd)?1'b1:1'b0;
assign	yEndEn=(yAddress<=yEnd)?1'b1:1'b0;
//当前点是否符合进入条件
assign	xThisEn	=(xAddress==xCal[CAL_WIDTH-1:SCALE_FRAC_WIDTH])?1'b1:1'b0;	//该列映射列重合，允许进入
assign	yThisEn	=(yAddress==yCal[CAL_WIDTH-1:SCALE_FRAC_WIDTH])?1'b1:1'b0;	//该行映射行重合，允许进入
assign	boundEn = xBgnEn&yBgnEn&xEndEn&yEndEn;


//h_valid control
always@(posedge clk or posedge rst)begin 
	if(rst) begin
		h_valid	<=	0;
	end
	else if ((xNxtAddress==inXRes)|(fifoNum==3'd4)) begin
		h_valid	<=	0;
	end
	else if((xAddress==0)&En)begin
		h_valid	<=	1;
	end
end//end always

//列变量跳变
always@(posedge clk or posedge rst )begin
	if(rst) begin					//如果重置或行/场同步信号为高，初始化变量
		xAddress<=0;
		xCal<=0;
		xPreEn<=0;
	end
	else if (xNxtAddress==inXRes) begin
		xAddress<=0;
		xCal<=0;
		xPreEn<=0;
	end
	else if(En&dInEn)begin 				
		xAddress<=xNxtAddress;
		xPreEn<=xThisEn;
		if(xThisEn)			//当[xCal]=xAddress xCal值改变
			xCal<=xNxtCal;
	end
end//end always

reg row_switch;
always@(posedge clk or posedge rst)begin
	if(rst)
		row_switch<=0;
	else if(En&xNxtAddress==inXRes)
		row_switch<=1;
	else
		row_switch<=0;
end
//v_valid control
always@(posedge clk or posedge rst)begin 
	if(rst)//reset or out of bound
		v_valid	<=	0;
	else if (yAddress==yEnd) begin
		v_valid	<=	0;
	end
	else if(En&(yAddress==0)&(!v_valid))
		v_valid	<=	1;
end//end always

//行变量跳变
always@(posedge clk or posedge rst)begin
	if(rst)begin					//如果重置或场同步信号为高，初始化变量，初始化变量
		yAddress<=0;
		yCal<=0;
		yPreEn<=0;
	end
	else if (yAddress==yEnd) begin
		yAddress<=0;
		yCal<=0;
		yPreEn<=0;
	end
	else if(En & row_switch) begin 				
		yAddress<=yNxtAddress;
		yPreEn<=yThisEn;
		if(yThisEn)			//当[xCal]=xAddress xCal值改变
			yCal<=yNxtCal;
	end
	
end//end always


//对RAM写入使能寄存器的使能
wire	yEn	=	yThisEn|yPreEn;	//本列映射重合或上一列映射重合，则允许进入
wire	xEn =	xThisEn|xPreEn; //本行映射重合或上一行映射重合，则允许进入
wire	trueEn	= yEn & xEn & boundEn & dInEn;

always@(posedge clk or posedge rst)begin
	if(rst) begin
		ramWrtAddr<={ADDRESS_WIDTH{1'b1}};//初始化为-1，则下一时刻变为0，从0开始写入
		ramWrtEn<=0;					   
		dataOut<={DATA_WIDTH{1'bz}};	
	end
	else if ((!h_valid)|(!v_valid)) begin
		ramWrtAddr<={ADDRESS_WIDTH{1'b1}};
		ramWrtEn<=0;			   
		dataOut<=0;	
	end
	else if (trueEn) begin			//当允许输入点
		ramWrtAddr<=ramWrtAddr+1;
		ramWrtEn<=1;
		dataOut<=dIn;
	end
	else 
		ramWrtEn<=0;
end
//control FIFO to jump
always@(posedge clk or posedge rst)begin
	if(rst) 
		jmp<=0;
	else if(row_switch)					//仅当行同步时才会实际需要跳FIFO
		jmp<=yEn;						//仅当当前行输入完成时才使FIFO跳变
	else 
		jmp<=0;
end
endmodule
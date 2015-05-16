/*
	开发者：林竞豪，张惠迪,陈天翼
*/

/*
	工作日志
	
	2014/12/20
		修改了逻辑，当输入两行数据未利用完时，全部由计算单元内部进行数据读取与控制
		为此增添了输出纵向分辨率ouNxtpuNxt_y_width，用于记录算到第几行
		
	2014/12/23
		将ouNxtpuNxt_y_width改为yAddress
		
	2014/12/27
		增加了一帧计算完后的外部控制信号frameFin
		
	2015/1/1
		注释掉了generate的冗长语句，资源占用大幅降低

	2015/1/3
		frameFin由输入变为输出
		删掉输出地址ouNxtAddress
		增加输出行、场同步信号 
		
	2015/2/10
		根据报告修改了输入输出端口的名字
		对原算法再次进行了simulation
	
	2015/2/12
		忘记备份原来的算法了
		写完新方案里放大部分的代码
		未进行仿真
	
	2015/2/15
		仿真失败
		WTF
		
	2015/2/16
		Ready to die = =
	2015/4/11
		修正reg、wire的误用
		完成FIFO版本模式0工作
		=
	2015/4/14
		调整了位宽 节省位宽资源
	2015/4/17
		加入新模式
*/



module Cal#(
	//可修改参数
	parameter DATA_WIDTH    = 16,
	parameter ADDRESS_WIDTH = 11,
	parameter NUM_WIDTH     = 8,
	parameter FRACTION_WIDTH= 6,
	parameter BUFFER_SIZE	= 3,
	parameter INPUT_RES_WIDTH= 10,		//输入分辨率地址位宽
	//不可修改参数
	parameter R_WIDTH      	= (DATA_WIDTH==16)?5:(DATA_WIDTH==24)?8:0,
	parameter G_WIDTH      	= (DATA_WIDTH==16)?6:(DATA_WIDTH==24)?8:0,
	parameter B_WIDTH      	= (DATA_WIDTH==16)?5:(DATA_WIDTH==24)?8:0,
	parameter CAL_WIDTH		= FRACTION_WIDTH + INPUT_RES_WIDTH,
	parameter INT_WIDTH		= CAL_WIDTH-FRACTION_WIDTH,
	parameter KINT_WIDTH	= NUM_WIDTH-FRACTION_WIDTH,
	parameter KF_WIDTH		= 1+ FRACTION_WIDTH
	)
(   //输入
    input wire clk,
	input wire rst,
	//来自inputCtrl
	input wire [ADDRESS_WIDTH-1:0]	ramAddrIn,			//inputCtrl写入ram的地址
	//来自RAMFIFO
	input wire [DATA_WIDTH-1:0]		ramData00,ramData01,
									ramData10,ramData11,//从ram里读取的数据值
	input wire [BUFFER_SIZE-1:0]   	fifoNum,			//FIFO中剩余的行数
	//来自coefCal
	input wire [NUM_WIDTH-1:0]    	kX,kY,				//横纵放大倍数的倒数
	input wire [ADDRESS_WIDTH-1:0]	inXNum,				//输入列数（xBgn-xEnd）
	input wire [ADDRESS_WIDTH-1:0]	inYNum,				//输入行数（yBgn-yEnd)
    input wire [ADDRESS_WIDTH-1:0]	outXRes,			//告知输出列数
	input wire [ADDRESS_WIDTH-1:0]	outYRes,			//告知输出行数
	
	//输出
	//输出至下一级
	output reg HS,				//输出行同步信号
	output reg VS,				//输出场同步信号
	output wire dOutEn,			//输出点同步信号
	//连接至ramFIFO
	output reg jmp1,jmp2,		//输出至ramfifo
	output wire [ADDRESS_WIDTH-1:0] ramRdAddr00,ramRdAddr01,
									ramRdAddr10,ramRdAddr11,//读取ram的地址
    output wire [DATA_WIDTH-1:0]    dOut					//每个输出像素的数值
);
reg	[ADDRESS_WIDTH-1:0]		yCount;			//当前使用了多少行
reg  [CAL_WIDTH:0]		u;  		//对应双线性插值算法中u值
reg [FRACTION_WIDTH-1:0]	uPreF;		//暂存u-kx,上一时刻的u小数部分的值
wire [CAL_WIDTH:0]	uNxt=u+kX;	//暂存u+kx，下一时刻给到u
wire [INT_WIDTH-1:0]	uI=u[INT_WIDTH+FRACTION_WIDTH-1:FRACTION_WIDTH];	//u的整数部分
wire [KINT_WIDTH:0]	uIK=u[KINT_WIDTH+FRACTION_WIDTH:FRACTION_WIDTH];	//u的整数部分，位宽与与k整数部分加一相同
wire [KINT_WIDTH:0]	uNxtIK=uNxt[KINT_WIDTH+FRACTION_WIDTH:FRACTION_WIDTH];//下一个时钟u的整数部分
wire [KINT_WIDTH:0]	uDistance=uNxtIK-uIK;	//当前u与下一个u的整数部分相差值
wire [KINT_WIDTH-1:0]	xAddrDistance=(uDistance>1)?2:uDistance;//下一时刻地址增量;

reg  [CAL_WIDTH:0]	v;			//对应双线性插值算法中v值
wire [CAL_WIDTH:0]	vNxt=v+kY;	//暂存v+ky，下一行给到v
wire [INT_WIDTH-1:0]	vI= v[INT_WIDTH+FRACTION_WIDTH-1:FRACTION_WIDTH];	//v的整数部分
wire [KINT_WIDTH:0]	vIK= v[KINT_WIDTH+FRACTION_WIDTH:FRACTION_WIDTH];	//v的整数部分
wire [KINT_WIDTH:0]	vNxtIK= vNxt[KINT_WIDTH+FRACTION_WIDTH:FRACTION_WIDTH];	//下一个v的整数部分;
wire [KINT_WIDTH:0]	vDistance=vNxtIK-vIK;	//当前v与下一个v的整数部分差值
wire [KINT_WIDTH-1:0]	yAddrDistance=(vDistance>1)?2'b10:vDistance;//下一行fifo增量;

wire [KF_WIDTH-1:0] F00;		//左上角点系数(当映射点恰好压在原图像，取左上角的值，因此需要多一个整数位
wire [FRACTION_WIDTH-1:0] F10;		//右上角点系数
wire [FRACTION_WIDTH-1:0] F01;		//左下角点系数
wire [FRACTION_WIDTH-1:0] F11;		//右下角点系数
reg  [ADDRESS_WIDTH-1:0] ramRdAddr;			//ram读取地址
reg	 [ADDRESS_WIDTH-1:0] xAddress;			//记录自己当前算到一行中的
reg  [ADDRESS_WIDTH-1:0] yAddress;			//记录自己算到第几行输出
reg	 [DATA_WIDTH-1:0]    dataReg10;			//工作模式2时暂存data10的数据

wire mode =(fifoNum>=2)?0:1;//FIFO中剩余行数大于等于2时，工作在模式0；否则工作在模式1。
		
//使能信号
reg	 dataReady;									//工作模式2数据已准备好标识位（仅模式1下有效
wire workEn		= (fifoNum==0)?0:1;				//FIFO中可用剩余行数等于0 不允许输入
wire ptEn 		= (ramRdAddr01<ramAddrIn)?1:0;			//输入指针小于输出指针则允许计算（仅模式1下有效）
wire outXLowEn	= (xAddress>0)?1:0;
wire outXUpEn	= (xAddress<=outXRes)?1:0;
wire outXBoundEn= outXLowEn&outXUpEn;			//x在输出边界内
wire outYLowEn	= (yAddress>0)?1:0;
wire outYUpEn	= (yAddress<=outYRes)?1:0;
wire outYBoundEn= outYLowEn&outYUpEn;			//y在输出边界内
wire inXBound	= (uI>=inXNum)?1:0;	//x输入抵达边界，此时插值后点在RAM中无对应点
wire inYBound	= (vI>=inYNum)?1:0;		//y输入抵达边界，此时插值后行在RAM中无对应行
reg dataReadyTrue;
wire enCal		= dataReadyTrue&ptEn; //模块允许计算!!
assign dOutEn	= outXBoundEn&outYBoundEn&enCal;		//输出使能

//读ram地址以及列累加模块
//reg	   [KINT_WIDTH-1:0]
assign ramRdAddr00 = ramRdAddr;
assign ramRdAddr01 = (inXBound==0)?(ramRdAddr+1):ramRdAddr;
assign ramRdAddr10 = (dataReadyTrue==0)?ramRdAddr:ramRdAddr+1;//!
					 //((mode==1)):;		 
assign ramRdAddr11 = 'bz;//工作模式1下11地址不工作

	always @(posedge clk or posedge rst) begin
		if(rst)
			dataReadyTrue <= 0;
		else
		begin
			if(dataReady)
			dataReadyTrue <= 1;
			else
			dataReadyTrue <= 0;
		end
	end

//MODE1模式下的数据存取状态机
parameter	[1:0]	INI=0,		//初始化兼MODE1跳变状态
					DELAY=1,	//等待时钟读数据
					STAY=2;		//保持状态
reg[1:0]cs,nxts;

always @ (posedge clk or posedge rst)  //异步复位
 if(rst)
   cs <= INI;
 else
   cs<= nxts;
  
always @ (posedge clk) begin  //状态转移
   case(cs)
	INI:begin //初始化
		dataReady = 0;
		nxts = DELAY;
	end
	DELAY:begin	//等待数据写入dataReg状态，此状态下dataReady恒为0
		dataReg10 = ramData10;	
		dataReady = 1;
		if(xAddrDistance == 0) begin	//当初始化时，若xAddrDistance == 0说明是放大情况，执行DELAY->STAY循环
			nxts = STAY;
		end
		else begin	//当初始化时，若xAddrDistance == 1说明是缩小情况，执行DELAY->INIT循环
			nxts = INI;
		end
	end
	STAY:begin	//保持ramData01,ramData11中的数据
		dataReady = 1;
		if(xAddrDistance == 0) begin
			nxts = STAY;
		end
		else begin
			dataReady = 0;
			nxts = DELAY;
		end
	end
	default:nxts = INI;  //要初始化，使得系统复位后能进入正确的状态  
   endcase
end

always @(posedge clk or posedge rst)
begin
	if(rst) begin
		xAddress<=0;
		u<=0;
		uPreF<=0;
		ramRdAddr<=0;
	end
	else if(!(outYUpEn&outXUpEn)) begin
		uPreF<=u[FRACTION_WIDTH-1:0];
		u<=0;
		ramRdAddr<=0;
		xAddress<=0;
	end
	else if(enCal) begin
		uPreF<=u[FRACTION_WIDTH-1:0];
		u<=uNxt;
		xAddress<=xAddress+1;
		if(!inXBound)//输入指针未超界 进行累加
		ramRdAddr<=ramRdAddr+xAddrDistance;
	end
end		

//行累加模块
always @(posedge clk or posedge rst)
begin
	if(rst) begin
		yAddress<=1;
		v<=0;
		jmp1<=0;jmp2<=0;
		HS<=0;VS<=0;
	end
	else if(!outYUpEn)begin		//一帧输出完毕
		v<=0;
		yAddress<=1;
		HS<=0;VS<=1;
		if(!inYBound) begin		//当此时没有压界
			if(jmp2==1)	
			jmp2<=0;
		end
		else  begin				//读取指针压界时
			jmp1<=1;jmp2<=0;
		end
	end
	else if(!outXUpEn) begin	//一行输出完毕
		yAddress<=yAddress+1;
		v<=vNxt;
		HS<=1;
		if (inYBound)begin		//当没有卡在边界上时
			jmp1<=0;jmp2<=0;
		end
		else 		//不需要跳	
			case(yAddrDistance)
			2'b01:	begin jmp1<=1;jmp2<=0;end
			2'b10:	begin jmp1<=0;jmp2<=1;end
			default: begin jmp1<=0;jmp2<=0;end
			endcase
	end
	else begin				//一般状态下关闭跳变开关
		jmp1<=0;jmp2<=0;
		VS<=0;HS<=0;
	end
end	

//插值模块
//四点的数据值
wire [DATA_WIDTH-1:0]		data00=ramData00;
wire [DATA_WIDTH-1:0]		data01=ramData01;//处于列边界上时取00点的值

//!
wire [DATA_WIDTH-1:0]		data10=(inYBound==0)?dataReg10:ramData00;//处于行边界上时取上一行的值
wire [DATA_WIDTH-1:0]		data11=(inYBound==0)?((inXBound==0)?ramData10:ramData10):data01;//边界处理
//!

//系数准备
wire [FRACTION_WIDTH-1:0]	uF=uPreF;	//u的小数部分
wire [FRACTION_WIDTH-1:0]	vF=v[FRACTION_WIDTH:0];	//v的小数部分
wire [KF_WIDTH-1:0]	one={{1'b1},{FRACTION_WIDTH{1'b0}}};	//单位1
wire [2*FRACTION_WIDTH-1:0] preuv = uPreF*v[FRACTION_WIDTH-1:0];
wire [FRACTION_WIDTH-1:0]	uv=preuv[2*FRACTION_WIDTH-1:FRACTION_WIDTH];		//u v小数部分的乘积
//系数运算
assign F00=one-uF-vF+uv;//(1-u)*(1-v)
assign F01=uF-uv;		//u*(1-v)
assign F10=vF-uv;    	//v*(1-u)
assign F11=uv;    		//uv
//插值运算
//三通道数据读取值
wire [R_WIDTH-1:0] dR00	=data00[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH];
wire [G_WIDTH-1:0] dG00	=data00[DATA_WIDTH-R_WIDTH-1:B_WIDTH];
wire [B_WIDTH-1:0] dB00	=data00[B_WIDTH-1:0];

wire [R_WIDTH-1:0] dR01	=data01[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH];
wire [G_WIDTH-1:0] dG01	=data01[DATA_WIDTH-R_WIDTH-1:B_WIDTH];
wire [B_WIDTH-1:0] dB01	=data01[B_WIDTH-1:0];

wire [R_WIDTH-1:0] dR10	=(mode==0)?data10[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH]:dataReg10[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH];
wire [G_WIDTH-1:0] dG10	=(mode==0)?data10[DATA_WIDTH-R_WIDTH-1:B_WIDTH]:dataReg10[DATA_WIDTH-R_WIDTH-1:B_WIDTH];
wire [B_WIDTH-1:0] dB10	=(mode==0)?data10[B_WIDTH-1:0]:dataReg10[B_WIDTH-1:0];
									
wire [R_WIDTH-1:0] dR11	=data11[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH];
wire [G_WIDTH-1:0] dG11	=data11[DATA_WIDTH-R_WIDTH-1:B_WIDTH];
wire [B_WIDTH-1:0] dB11	=data11[B_WIDTH-1:0];

wire [FRACTION_WIDTH+R_WIDTH-1:0]F00R00 = F00*dR00;
wire [FRACTION_WIDTH+R_WIDTH-1:0]F01R01 = F01*dR01;
wire [FRACTION_WIDTH+R_WIDTH-1:0]F10R10 = F10*dR10;
wire [FRACTION_WIDTH+R_WIDTH-1:0]F11R11 = F11*dR11;
wire [FRACTION_WIDTH+G_WIDTH-1:0]F00G00 = F00*dG00;
wire [FRACTION_WIDTH+G_WIDTH-1:0]F01G01 = F01*dG01;
wire [FRACTION_WIDTH+G_WIDTH-1:0]F10G10 = F10*dG10;
wire [FRACTION_WIDTH+G_WIDTH-1:0]F11G11 = F11*dG11;
wire [FRACTION_WIDTH+B_WIDTH-1:0]F00B00 = F00*dB00;
wire [FRACTION_WIDTH+B_WIDTH-1:0]F01B01 = F01*dB01;
wire [FRACTION_WIDTH+B_WIDTH-1:0]F10B10 = F10*dB10;
wire [FRACTION_WIDTH+B_WIDTH-1:0]F11B11 = F11*dB11;

wire [R_WIDTH-1:0] dRout=(F00R00[FRACTION_WIDTH+R_WIDTH-1:FRACTION_WIDTH])+(F01R01[FRACTION_WIDTH+R_WIDTH-1:FRACTION_WIDTH])+(F10R10[FRACTION_WIDTH+R_WIDTH-1:FRACTION_WIDTH])+(F11R11[FRACTION_WIDTH+R_WIDTH-1:FRACTION_WIDTH]);			
wire [G_WIDTH-1:0] dGout=(F00G00[FRACTION_WIDTH+G_WIDTH-1:FRACTION_WIDTH])+(F01G01[FRACTION_WIDTH+G_WIDTH-1:FRACTION_WIDTH])+(F10G10[FRACTION_WIDTH+G_WIDTH-1:FRACTION_WIDTH])+(F11G11[FRACTION_WIDTH+G_WIDTH-1:FRACTION_WIDTH]);		
wire [B_WIDTH-1:0] dBout=(F00B00[FRACTION_WIDTH+B_WIDTH-1:FRACTION_WIDTH])+(F01B01[FRACTION_WIDTH+B_WIDTH-1:FRACTION_WIDTH])+(F10B10[FRACTION_WIDTH+B_WIDTH-1:FRACTION_WIDTH])+(F11B11[FRACTION_WIDTH+B_WIDTH-1:FRACTION_WIDTH]);
assign			   dOut[DATA_WIDTH-1:DATA_WIDTH-R_WIDTH]=dRout;
assign			   dOut[DATA_WIDTH-R_WIDTH-1:B_WIDTH]=dGout;
assign			   dOut[B_WIDTH-1:0]=dBout;

endmodule
/*always @(posedge clk or posedge rst) begin
		if(rst)
			dataReadyTrue <= 0;
		else
		begin
			if(dataReady)
			dataReadyTrue <= 1;
			else
			dataReadyTrue <= 0;
		end
	end
	parameter	[1:0]	INI=0,	//初始化兼MODE1跳变状态
							DELAY=1,	//等待时钟读数据
							STAY=3;	//保持状态
	reg[1:0]cs,nxts;

	always @ (posedge clk or posedge rst)  //异步复位
	 if(rst)
	   cs <= INI;
	 else
	   cs<= nxts;

	always @ (posedge clk) begin  //电平触发
	   case(cs)
		INI:begin //初始化
			dataReady = 0;
			nxts = DELAY;
		end
		DELAY:begin
			dataReg10 = ramData10;	
			dataReady = 0;
						//xAddrDistance需要延时跳变
			if(xAddrDistance == 0) begin	//当初始化时，若xAddrDistance == 0说明是放大情况，执行DELAY->STAY循环
				nxts = STAY;
			end
			else begin	//当初始化时，若xAddrDistance == 1说明是缩小情况，执行DELAY->INIT循环
				dataReady = 1;
				nxts = INI;
			end
		end
		STAY:begin	//保持ramData01,ramData11中的数据
			dataReady = 1;
			if(xAddrDistance == 0) begin
				nxts = STAY;
			end
			else begin
				nxts = DELAY;
			end
		end
		default:nxts = INI;  //要初始化，使得系统复位后能进入正确的状态  
	   endcase
	end*/
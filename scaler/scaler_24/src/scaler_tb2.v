`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// 
// 作者：陈天翼
//
// Create Date:   09:28:01 03/31/2015
// Design Name:   scaler
// Module Name:   D:/test/tb.v
// Project Name:  test
// Description: 用以检测scaler 时序，无图片
// Revision 1.01 
// 
////////////////////////////////////////////////////////////////////////////////
/************************************************************
原理：试用状态机模仿VGA输入时序，数据为从0开始的16位数，进行测试
使用说明：通过initial input data 模块修改缩放参数
*************************************************************/
module tb2;

parameter	DATA_WIDTH 		=	24;		//?????
parameter	INPUT_RES_WIDTH	=  	11;		//?????????
parameter	SCALE_FRAC_BITS =	6;		//kY?????????????
parameter 	SCALE_INT_BITS	=	2; 		//kY?????????????
parameter 	RAM_SIZE_WIDTH 	=	11;		//RAM?????
								
								//不可修改参数
parameter 	SCALE_BITS 	= SCALE_FRAC_BITS + SCALE_INT_BITS;//kY???
parameter	CAL_BITS 	= INPUT_RES_WIDTH+SCALE_FRAC_BITS; //?????????????

	// Inputs
	reg clka;
	reg clkb;
	reg rst;
	reg en;
	reg [15:0] dIn;
	reg dInEn;
	reg [10:0] xBgn;
	reg [10:0] xEnd;
	reg [10:0] yBgn;
	reg [10:0] yEnd;
	reg [10:0] inYRes;
	reg [10:0] inXRes;
	reg [10:0] outYRes;
	reg [10:0] outXRes;
	reg iHsyn;
	reg iVsyn;

	// Outputs
	wire [15:0] dOut;
	wire dOutEn;
	wire HS;
	wire VS;

	// Instantiate the Unit Under Test (UUT)
	scaler uut (
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

	initial begin
		// Initialize Inputs
		clka = 0;
		clkb = 0;
		rst = 0;
		en = 0;
		dIn = 0;
		dInEn = 0;
		//这里修改输入输出分辨率参数
		xBgn = 0;
		xEnd = 3-1;
		yBgn = 0;
		yEnd = 3-1;
		inXRes = 3;
		inYRes = 3;
		outXRes = 6;
		outYRes = 6;

	end
	
	initial // Clock generator
	  begin
		#10 //Delay to allow filename to get here
		clka = 0;
		forever #10 clka = !clka;
	  end
	  
	  initial // Clock generator
	  begin
		#10 //Delay to allow filename to get here
		clkb = 0;
		forever #1 clkb = !clkb;
	  end


	initial	// Reset
	  begin
		rst = 0;
		#5 rst = 1;
		#4 rst = 0;
	   // #50000 $stop;
	  end
     
reg	[INPUT_RES_WIDTH-1:0] x;
reg	[INPUT_RES_WIDTH-1:0] y;
reg	Start;
initial 
   begin// this process block specifies the stimulus.

	 
	  Start<=0;	  
	  #10
	  Start<=1;
	 // $stop;
end

parameter	[2:0]	INI=0,//初始化
						SWITCH_FRAME=1,
						SWITCH_ROW=2,//切换行
						PIX_IN=3,		//切换列
						END_FRAME=4;
reg[2:0]cs,nxts;

always @ (posedge clka or posedge rst)  //异步复位
 if(rst)
   cs <= #1 INI;
 else
   cs<= #1 nxts;


always @ (clka) begin  //电平触发
   case(cs)
   INI:begin //初始化
		if(Start)
			nxts =  PIX_IN;
		else
			nxts =  INI;
	end
	PIX_IN:begin
			if(x==inXRes)
				nxts=SWITCH_ROW;
			else
				nxts=PIX_IN;
	end
	SWITCH_ROW:begin//切换下一行
			if(y==inYRes)
				nxts = SWITCH_FRAME;
			else
				nxts = PIX_IN;
	end
	SWITCH_FRAME:begin//切换下一帧
			nxts = END_FRAME;
	end
	END_FRAME:begin
		nxts = END_FRAME;
		
	end
		default:nxts = INI;  //要初始化，使得系统复位后能进入正确的状态  
   endcase
end


always @ (posedge clka)begin
 case(nxts)
	INI:begin	
		y<=0;
		x<=0;
		iVsyn<=1;
		iHsyn<=0;		
		dInEn<=0;
		//dIn<=0;
		en<=1;
		end
	PIX_IN:begin
		dInEn <=1;
		iVsyn<=0;
		iHsyn<=0;
		x<=x+1;
		//r = $fread(readMem, rfile);
		dIn = dIn+1;
		//dIn = readMem[0];
		end
	SWITCH_ROW:begin
		y<=y+1;
		x<=0;
		iHsyn<=1;
		iVsyn<=0;
		dInEn<=0; 
		end
	SWITCH_FRAME:begin
		y<=0;
		x<=0;
		iVsyn<=1;
		iHsyn<=0;		
		dInEn<=0;
		end
	END_FRAME:begin
		iVsyn<=0;
		dInEn<=1;
		end
	default: nxts = INI;  //要初始化，使得系统复位后能进入正确的状态  
	endcase
end

	 
endmodule


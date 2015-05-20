`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:23:06 05/20/2015
// Design Name:   inputCtrl
// Module Name:   D:/test/inputCtrlTB.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inputCtrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module inputCtrlTB;

	// Inputs
	reg clk;
	reg rst;
	reg [9:0] xBgn;
	reg [9:0] xEnd;
	reg [9:0] yBgn;
	reg [9:0] yEnd;
	reg dInEn;
	reg [23:0] dIn;
	reg En;
	reg [7:0] kX;
	reg [7:0] kY;
	reg [9:0] inXRes;
	reg [2:0] fifoNum;

	// Outputs
	wire [10:0] ramWrtAddr;
	wire ramWrtEn;
	wire [23:0] dataOut;
	wire jmp;
	wire v_valid;
	wire h_valid;

	// Instantiate the Unit Under Test (UUT)
	inputCtrl uut (
		.clk(clk), 
		.rst(rst), 
		.xBgn(xBgn), 
		.xEnd(xEnd), 
		.yBgn(yBgn), 
		.yEnd(yEnd), 
		.dInEn(dInEn), 
		.dIn(dIn), 
		.En(En), 
		.kX(kX), 
		.kY(kY), 
		.ramWrtAddr(ramWrtAddr), 
		.ramWrtEn(ramWrtEn), 
		.dataOut(dataOut), 
		.jmp(jmp), 
		.inXRes(inXRes), 
		.fifoNum(fifoNum), 
		.v_valid(v_valid), 
		.h_valid(h_valid)
	);
	initial // Clock generator
	  begin
		#10 //Delay to allow filename to get here
		clk = 0;
		forever #5 clk = !clk;
	  end
	  
	initial begin
		// Initialize Inputs
		rst = 1;
		dInEn = 0;
		dIn = 0;
		En = 0;
		kX = 'b 00100000;//0.5
		kY = 'b 00100000;//0.5
		inXRes = 0;
		fifoNum = 0;
		xBgn = 0;
		xEnd = 3-1;
		yBgn = 0;
		yEnd = 3-1;
		inXRes = 3;


		// Wait 100 ns for global reset to finish
		#10;
		En=1;
		rst=0;
		dInEn=1;
        
		// Add stimulus here

	end
    always @(posedge clk) begin
		if (clk) begin
			dIn=dIn+1;
		end
	end
endmodule


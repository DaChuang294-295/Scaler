/*
功能：在数据输入到存储单元前判断该点是否是需要输入的点，仅允许需要输入的点
作者: 林翰
版本: 2.0
最后修改日期：2014/4/1
修改内容：指针跳转敏感信号由时钟改为跳转信号
*/ 
 
module ramFifo #(
	parameter DATA_WIDTH = 16,
	parameter ADDRESS_WIDTH = 11,
	parameter BUFFER_SIZE = 4,
	parameter BUFFER_SIZE_WIDTH =	((BUFFER_SIZE+1) <= 2) ? 1 :	
									((BUFFER_SIZE+1) <= 4) ? 2 :
									((BUFFER_SIZE+1) <= 8) ? 3 :
									((BUFFER_SIZE+1) <= 16) ? 4 :
									((BUFFER_SIZE+1) <= 32) ? 5 :
									((BUFFER_SIZE+1) <= 64) ? 6 : 7
)(
	input wire 						clka,
	input wire						clkb,
	input wire 						rst,
	input wire						advanceRead1,	//读取指针移动一位
	input wire						advanceRead2,	//读取指针移动两位
	input wire						advanceWrite,	//写入指针移动一位

	input wire [DATA_WIDTH-1:0]		writeData,		//写入的数据
	input wire [ADDRESS_WIDTH-1:0]	writeAddress,	//将被写入的RAM的地址
	input wire						writeEnable,	//写入使能
	output reg [BUFFER_SIZE_WIDTH-1:0]
									fillCount,		//完成写入的剩余RAM

	//										yx
	output wire [DATA_WIDTH-1:0]	readData00,		//从最深处的RAM读取位于readAddress的数据
	output wire [DATA_WIDTH-1:0]	readData01,		//从最深处的RAM读取位于（readAddress+1）的数据
	output wire [DATA_WIDTH-1:0]	readData10,		//从第二深处的RAM读取位于readAddress的数据
	output wire [DATA_WIDTH-1:0]	readData11,		//从第二深处的RAM读取位于（readAddress+1）的数据
	input wire [ADDRESS_WIDTH-1:0]	readAddress00,
	input wire [ADDRESS_WIDTH-1:0]	readAddress01,
	input wire [ADDRESS_WIDTH-1:0]	readAddress10,
	input wire [ADDRESS_WIDTH-1:0]	readAddress11
);

reg [BUFFER_SIZE-1:0]		writeSelect;
reg [BUFFER_SIZE-1:0]		readSelect;

//读取指针移动操作
always @(posedge advanceRead1 or posedge advanceRead2 or posedge rst)
begin
	if(rst)
		readSelect <= 1;
	else
	begin
		if(advanceRead1)
		begin
			readSelect <= {readSelect[BUFFER_SIZE-2 : 0], readSelect[BUFFER_SIZE-1]};
		end
		else if(advanceRead2)
		begin
			readSelect <= {readSelect[BUFFER_SIZE-3 : 0], readSelect[BUFFER_SIZE-1:BUFFER_SIZE-2]};
		end
	end
end

//写入指针移动操作
always @(posedge advanceWrite or posedge rst)
begin
	if(rst)
		writeSelect <= 1;
	else
	begin
		if(advanceWrite)
		begin
			writeSelect <= {writeSelect[BUFFER_SIZE-2 : 0], writeSelect[BUFFER_SIZE-1]};
		end
	end
end

wire [DATA_WIDTH-1:0] ramDataOutA [2**BUFFER_SIZE-1:0];
wire [DATA_WIDTH-1:0] ramDataOutB [2**BUFFER_SIZE-1:0];

wire [ADDRESS_WIDTH-1:0] readAddressA0;
wire [ADDRESS_WIDTH-1:0] readAddressA1;
wire [ADDRESS_WIDTH-1:0] readAddressB0;
wire [ADDRESS_WIDTH-1:0] readAddressB1;
wire [ADDRESS_WIDTH-1:0] readAddressC0;
wire [ADDRESS_WIDTH-1:0] readAddressC1;
wire [ADDRESS_WIDTH-1:0] readAddressD0;
wire [ADDRESS_WIDTH-1:0] readAddressD1;

wire					clka0;
wire					clka1;
wire					clka2;
wire					clka3;

//例化M7的内置ram
emb_16_2k ram_inst_0(
				.clka( clka0 ),
				.clkb( clkb ),
				.cea( 1 ),
				.ceb( 1 ),
				
				//Port A is written to as well as read from. When writing, this port cannot be read from.
				//As long as the buffer is large enough, this will not cause any problem.
				.aa( (writeSelect[0] == 1'b1) ? writeAddress : readAddressA0 ),	//&& writeEnable is 
				//to allow the full buffer to be used. After the buffer is filled, write is advanced, so writeSelect
				//and readSelect are the same. The full buffer isn't written to, so this allows the read to work properly.
				.da( writeData ),													
				.wea( (writeSelect[0] == 1'b1)  ? writeEnable : 1'b0 ),
				.qa( ramDataOutA[2**0] ),
				
				.ab( readAddressA1 ),
				.db( 0 ),
				.web( 1'b0 ),
				.qb( ramDataOutB[2**0] )
			);

emb_16_2k ram_inst_1(
				.clka( clka1 ),
				.clkb( clkb ),
				.cea( 1 ),
				.ceb( 1 ),
				
				//Port A is written to as well as read from. When writing, this port cannot be read from.
				//As long as the buffer is large enough, this will not cause any problem.
				.aa( (writeSelect[1] == 1'b1) ? writeAddress : readAddressB0 ),	//&& writeEnable is 
				//to allow the full buffer to be used. After the buffer is filled, write is advanced, so writeSelect
				//and readSelect are the same. The full buffer isn't written to, so this allows the read to work properly.
				.da( writeData ),													
				.wea( (writeSelect[1] == 1'b1)  ? writeEnable : 1'b0 ),
				.qa( ramDataOutA[2**1] ),
				
				.ab( readAddressB1 ),
				.db( 0 ),
				.web( 1'b0 ),
				.qb( ramDataOutB[2**1] )
			);

emb_16_2k ram_inst_2(
				.clka( clka2 ),
				.clkb( clkb ),
				.cea( 1 ),
				.ceb( 1 ),
				
				//Port A is written to as well as read from. When writing, this port cannot be read from.
				//As long as the buffer is large enough, this will not cause any problem.
				.aa( (writeSelect[2] == 1'b1) ? writeAddress : readAddressC0 ),	//&& writeEnable is 
				//to allow the full buffer to be used. After the buffer is filled, write is advanced, so writeSelect
				//and readSelect are the same. The full buffer isn't written to, so this allows the read to work properly.
				.da( writeData ),													
				.wea( (writeSelect[2] == 1'b1)  ? writeEnable : 1'b0 ),
				.qa( ramDataOutA[2**2] ),
				
				.ab( readAddressC1 ),
				.db( 0 ),
				.web( 1'b0 ),
				.qb( ramDataOutB[2**2] )
			);
			
emb_16_2k ram_inst_3(
				.clka( clka3 ),
				.clkb( clkb ),
				.cea( 1 ),
				.ceb( 1 ),
				
				//Port A is written to as well as read from. When writing, this port cannot be read from.
				//As long as the buffer is large enough, this will not cause any problem.
				.aa( (writeSelect[3] == 1'b1) ? writeAddress : readAddressD0 ),	//&& writeEnable is 
				//to allow the full buffer to be used. After the buffer is filled, write is advanced, so writeSelect
				//and readSelect are the same. The full buffer isn't written to, so this allows the read to work properly.
				.da( writeData ),													
				.wea( (writeSelect[3] == 1'b1)  ? writeEnable : 1'b0 ),
				.qa( ramDataOutA[2**3] ),
				
				.ab( readAddressD1 ),
				.db( 0 ),
				.web( 1'b0 ),
				.qb( ramDataOutB[2**3] )
			);
			
//选择从读取的ram
wire [BUFFER_SIZE-1:0]	readSelect0 = readSelect;
wire [BUFFER_SIZE-1:0]	readSelect1 = (readSelect << 1) | readSelect[BUFFER_SIZE-1];

assign readAddressA0 = (readSelect[0] == 1'b1) ? readAddress00 : readAddress10;
assign readAddressA1 = (readSelect[0] == 1'b1) ? readAddress01 : readAddress11;
assign readAddressB0 = (readSelect[1] == 1'b1) ? readAddress00 : readAddress10;
assign readAddressB1 = (readSelect[1] == 1'b1) ? readAddress01 : readAddress11;
assign readAddressC0 = (readSelect[2] == 1'b1) ? readAddress00 : readAddress10;
assign readAddressC1 = (readSelect[2] == 1'b1) ? readAddress01 : readAddress11;
assign readAddressD0 = (readSelect[3] == 1'b1) ? readAddress00 : readAddress10;
assign readAddressD1 = (readSelect[3] == 1'b1) ? readAddress01 : readAddress11;

assign clka0 = ( writeSelect[0] == 1'b1) ? clka : clkb;
assign clka1 = ( writeSelect[1] == 1'b1) ? clka : clkb;
assign clka2 = ( writeSelect[2] == 1'b1) ? clka : clkb;
assign clka3 = ( writeSelect[3] == 1'b1) ? clka : clkb;

//将数据输出到对应的output口
assign readData00 = ramDataOutA[readSelect0];
assign readData10 = ramDataOutA[readSelect1];
assign readData01 = ramDataOutB[readSelect0];
assign readData11 = ramDataOutB[readSelect1];

//对已填充的ram进行计数
always @(posedge advanceWrite or posedge advanceRead1 or posedge advanceRead2 or posedge rst)
begin
	if(rst)
	begin
		fillCount <= 0;
	end
	else
	begin
		if(advanceWrite)
		begin
			if(advanceRead1)
				fillCount <= fillCount;
			else if(advanceRead2)
				fillCount <= fillCount - 1;
			else
				fillCount <= fillCount + 1;
		end
		else
		begin
			if(advanceRead1)
				fillCount <= fillCount - 1;
			else if(advanceRead2)
				fillCount <= fillCount - 2;
			else
				fillCount <= fillCount;
		end
	end
end

endmodule //ramFifo

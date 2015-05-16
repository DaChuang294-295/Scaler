//17-bit divider

module mdivider(reset,ratio,remainder,error,divisor,dividend);

input reset;
input[16:0] divisor;        //输入17位除数
input[16:0] dividend;       //输入17位被除数
output[16:0] ratio;          //输出17位比率
output[16:0] remainder;      //输出17位余数
output error;           //错误信号
reg[33:0] shift_dividend;     //用来移位的34位被除数寄存器
reg[16:0] divisor_a;          //存放除数的寄存器
reg[16:0] ratio;               //比率寄存器
reg[16:0] remainder;            //余数寄存器
wire error=(divisor==17'b0);     //当除数为0时错误信号为真

always @(divisor or dividend)
begin
	if(reset||error)              //当reset或error为真时，所有寄存器置0
	begin
		ratio=17'b0;
		remainder=17'b0;
		divisor_a=17'b0;
		shift_dividend=17'b0;
	end
	else if(divisor>dividend)       //当被除数小于除数时，直接判定比率为0，余数即除数
	begin
		ratio=17'b0;
		remainder=dividend;
	end
	else if(divisor==17'b1)         //当除数为1时，比率即被除数，余数为0
	begin
		ratio=dividend;
		remainder=17'b0;
	end
	else
	begin
		ratio=17'b0;
		divisor_a=divisor;
		shift_dividend=dividend;      //将17位被除数读入34位的移位寄存器的低17位
		shift_dividend=shift_dividend<<1;
		repeat(16)                     //再将32位移位寄存器的的数进行16次左移计算
		begin
			ratio=ratio<<1;       //将已得出的比率左移并根据下一位除数与被除数的比较得出比率最低位的值
			shift_dividend=shift_dividend<<1;  //将34位移位寄存器的低17位的最高为移入高17位
			if(divisor_a<shift_dividend[33:17]) //比较33位移位寄存器的高17位与除数
			begin
				shift_dividend[33:17]=shift_dividend[33:17]-divisor_a;
				ratio=ratio+1;
			end      //如果移位寄存器的高17位大于除数，则移位寄存器高17位的值为它们的差，并将比率寄存器的最低位+1
		end
		remainder=shift_dividend[33:17];//经过16次移位计算，34移位寄存器高17位的值即位余数
	end
end
endmodule
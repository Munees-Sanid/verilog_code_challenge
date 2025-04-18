// 4 bit alu

module alu (
	input [3:0]a,b,
	input [2:0]op,
	output reg [4:0]y);
always @(*)begin
case(op)
3'b000: y=a+b;
3'b001: y=a-b;
3'b010: y=a%b;
3'b011: y=a*b;
3'b100: y=a&b;
3'b101: y=a|b;
3'b110: y=a^b;
3'b111: y=~(a^b);
endcase
end
endmodule



// test bench

module tb;
reg [3:0]a=10,b=3;
reg [2:0]op;
wire [4:0]y;
reg[8*4:0]sym;
alu dut(a,b,op,y);
initial begin
$monitor(" a = %b(%d)    %s      b =%b(%d)  op=%b   ::  y= %b (%d)" , a,a,sym,b,b,op,y,y); 
for(integer i =0;i<2**3; i=i+1)begin
op=i;
case(i)
3'b000 : sym="+";
3'b001 : sym="-";
3'b010 : sym="%";
3'b011 : sym="*";
3'b100 : sym="&";
3'b101 : sym="|";
3'b110 : sym="^";
3'b111 : sym="~^";
endcase
 #5; end
end
endmodule

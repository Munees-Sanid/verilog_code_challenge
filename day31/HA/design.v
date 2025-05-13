// full subtractor using data flow modeling
module FS_df(
	input a,b,c,
	output diff,borrow);
assign diff=a^b^c;
assign borrow=(~a&b)|(~a&c)|(b&c);
endmodule


// full subtractor using behavioral modeling
module FS_beh(
	input a,b,c,
	output reg diff,borrow);
	always@(a,b,c)begin
 			diff=a^b^c;
 			borrow=(~a&b)|(~a&c)|(b&c);
end
endmodule


// full subtractor using half subtractor

module HA(
	input a,b,
	output diff,borrow);
assign diff=a^b;
assign borrow=(~a&b);
endmodule

// top module instiatiation 

module FS_str(
	input a,b,c,
	output diff,borrow);
wire w1,w2,w3;
HA a1(a,b,w1,w2);
HA a2(w1,c,diff,w3);
assign borrow=w3|w2;
endmodule

// test bench for full subractor

module tb;
reg a,b,c;
wire diff_df,diff_beh, diff_str, borrow_df, borrow_beh, borrow_str;
FS_df dut1(a,b,c,diff_df,borrow_df);
FS_beh dut2(a,b,c,diff_beh,borrow_beh);
FS_str dut3(a,b,c,diff_str,borrow_str);
initial begin
$monitor("a=%b b = %b  c= %b ::  diff_df = %b,diff_beh = %b, diff_str = %b , borrow_df = %b , borrow_beh = %b, borrow_str = %b",a,b,c,diff_df,diff_beh, diff_str, borrow_df, borrow_beh, borrow_str);
for(integer i=0;i<2**3;i=i+1)
begin
{a,b,c}=i;
#2;
end
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

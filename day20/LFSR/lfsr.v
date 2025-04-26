`include"dff.v"
module lfsr(
	input clk,
	output wire [7:0]q);
wire y,y1,y2;
dff f1(y,clk,q[0]);
dff f2(q[0],clk,q[1]);
dff f3(q[1],clk,q[2]);
dff f4(q[2],clk,q[3]);
dff f5(q[3],clk,q[4]);
dff f6(q[4],clk,q[5]);
dff f7(q[5],clk,q[6]);
dff f8(q[6],clk,q[7]);
assign y1 = q[6]^q[7];
assign y2 = q[4]^q[5];
assign y= y1^y2;
endmodule

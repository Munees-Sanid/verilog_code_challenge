// 10x1 using 4x1 
`include"mux.v"
module mux10(
	input [15:0]i,
	input [3:0]s,
	output y);
wire [1:0]w;
mux m1(i[3:0],s[1:0],w[0]);
mux m2(i[7:4],s[1:0],w[1]);
mux m3({i[9],i[8],w}, s[3:2], y);
endmodule

// test bench

module tb;
reg [15:0]i=16'b1010_1010_1010_1010;
reg [3:0]s;
wire y;
mux10 dut(i,s,y);
initial begin
$monitor("i = %b  s = %b  ::  y=%b ",i,s,y);
for(integer j=0; j<2**4;j=j+1)begin
s=j; #5;end
end
endmodule

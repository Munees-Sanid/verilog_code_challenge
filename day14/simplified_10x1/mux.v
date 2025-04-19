//4x1 mux
module mux( 
	input [3:0]i,
	input [1:0]s,
	output y);
assign y = (s[1])?((s[0])?i[3]:i[2]):((s[0])?i[1]:i[0]);
endmodule


// 10x1 using 4x1 "

module mux10(
	input [15:0]i,
	input [3:0]s,
	output y);
wire [1:0]w;
wire l1,l2,l3,l4;
not n1(l1,s[0]);
not n2(l2,s[3]);
and a1(l3,i[8],l1);
and a2(l4,i[9],s[0]);
and a3(l5,l2,s[2]);
mux m1(i[3:0],s[1:0],w[0]);
mux m2(i[7:4],s[1:0],w[1]);
mux m3({l4,l3,w}, {s[3],l5}, y);
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

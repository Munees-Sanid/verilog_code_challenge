// 4x16 using 2x4 decoder
`include"dec2x4.v"
module dec16(
	input [3:0]i,
	output [15:0]y);
wire [3:0]w;
dec d1(1'b1, i[3:2],w);
dec d(w[3], i[1:0],y[15:12]);
dec d3(w[2], i[1:0],y[11:8]);
dec d4(w[1], i[1:0],y[7:4]);
dec d5(w[0], i[1:0],y[3:0]);
endmodule


// Testbench

module tb;
reg [3:0]i;
wire [15:0]y;
dec16 dut(i,y);
initial begin 
for(integer j =0;j<=15;j=j+1)begin
#5 i=j;end
end
initial begin
$monitor("i=%b  :: y=%b",i,y);
end
endmodule

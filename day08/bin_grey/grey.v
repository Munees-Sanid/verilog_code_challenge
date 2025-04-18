// binary to grey 

module grey(
	input [3:0]b,
	output [3:0]g);
assign g[3]=b[3];
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];
endmodule

// testbench

module tb;
reg [3:0]b;
wire [3:0]g;
grey dut(b,g);
initial begin 
$monitor("b = %b    ::  g = %b",b,g);
for(integer i=0; i<2**4; i=i+1)begin
b=i; #5; end
end
endmodule

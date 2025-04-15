module multiplier(
	input [3:0]n,
	output [8*15:0]y);
assign y = n << 3;
endmodule

module tb;
reg [3:0]n;
wire [8*15:0]y;
integer i;
multiplier dut (.*);
initial begin
for(i=0 ; i<=15 ; i=i+1)begin
#5 n=i;
end
end
initial begin
$monitor(" 8 * %d  ::  y = %0d",n,y);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


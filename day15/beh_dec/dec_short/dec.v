// 2x4 decoder using short cut method 

module dec(
	input [2:0]i,
	input en,
	output reg [7:0]y);
always@(i,en)
	y= (en)?(8'b1<<i):8'bz;

endmodule 

// test bench

module tb;
reg[2:0]i;
reg en;
wire [7:0]y;
dec dut(i,en,y);
initial begin
$monitor("en = %b  ||   i = %b  :: y=%b ",en,i,y);
for(integer j=0;j<2**4;j=j+1)begin
{en,i}=j; #5; end
end
endmodule



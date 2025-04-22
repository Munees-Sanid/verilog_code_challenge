// design code for d latch
module dlatch(
	input d,clk,rst,
	output reg q);
always@(d,clk,rst)begin
	if(clk)
		if(rst)
		q<=1'b0;
		else
		q<=d;
	else
	q<=q;
end
endmodule



// test bench

module tb;
reg d,clk,rst;
output q;
dlatch dut(d,clk,rst,q);

initial begin
$monitor("d = %b  clk = %b  reset =%b  ::  output q = %b ",d,clk,rst,q);
for(integer i =0; i<2**3;i++)begin
{clk,rst,d}=i; #5; end
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule 


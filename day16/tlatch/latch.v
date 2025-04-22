// design code for d latch
module tlatch(
	input t,clk,rst,
	output reg q);
	reg temp;
always@(t,clk,rst)begin
	if(~clk)
		if(rst)
		temp<=0;
		else if(t)
		temp<=~temp;
	else 
	temp<=temp;
q=temp;
end
endmodule



// test bench

module tb;
reg t,clk,rst;
output q;
tlatch dut(t,clk,rst,q);

initial begin
$monitor("t = %b  clk = %b  reset =%b  ::  output q = %b ",t,clk,rst,q);
for(integer i =0; i<2**3;i++)begin
{t,rst,clk}=i; #5; end
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule 


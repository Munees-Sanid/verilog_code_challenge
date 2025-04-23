// design code for syn tff
module tff(
	input t,clk,rst,
	output reg q);
reg temp;
always@(posedge clk)begin
	if(rst)
		temp<=0;
	else if(t)
	temp <=~temp;
q<=temp;
end
endmodule

// test bench

module tb;
reg t,clk,rst;
wire q;
tff dut(t,clk,rst,q);
always #5 clk=~clk;
initial begin
$monitor("rst =%b  clk=%b  t =%b  ::  q=%b",rst,clk,t,q);
clk=0;
#5 rst=1;
#5 rst=0; t=0;
#5 t=1;
#5 t=0;
#5 t=1;
#4 t=1;
#20 $finish;
end
endmodule


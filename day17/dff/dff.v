// design code for asyn dff
module tff(
	input d,clk,rst,
	output reg q);
always@(posedge clk or posedge rst)begin
	if(rst)
		q<=0;
	else
	q <=d;
end
endmodule

// test bench

module tb;
reg d,clk,rst;
wire q;
tff dut(d,clk,rst,q);
always #5 clk=~clk;
initial begin
$monitor("rst =%b  clk=%b  d =%b  ::  q=%b",rst,clk,d,q);
clk=0;
#5 rst=1;
#5 rst=0; d=0;
#5 d=1;
#5 d=0;
#5 d=0;
#4 d=0;
#20 $finish;
end
endmodule


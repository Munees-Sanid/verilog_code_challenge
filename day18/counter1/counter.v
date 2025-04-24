// design code for counter

module counter(
	input rst,clk,m,
	output [2:0]count);
reg [2:0]temp;
always@(posedge clk)begin
	if(rst)
		temp<=0;
	else if(m)
	temp<temp+1;
	else
	temp<=~temp;
	end
	
	assign count = temp;
endmodule

// test bench

module tb;
reg rst,clk,m;
wire [2:0]count;
counter dut(rst,clk,m,count);
always #5 clk = ~clk;
initial begin
$monitor("time =0%t   rst =%b  ::   count =%b ",$time,rst,count);
clk=0;
rst=1;
#13 rst=0;
m=1;
#70 m=1;
#200 $finish;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule



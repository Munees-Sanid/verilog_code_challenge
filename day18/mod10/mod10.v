// design code for mod-10 counter

module counter(
	input rst,clk,
	output [3:0]count);
reg [3:0]temp;
always@(posedge clk)begin
	if(rst)
		temp<=0;
	else if(temp==9)
		temp<=0;
	else
		temp<=temp+1;
	end
assign count=temp;
endmodule

// test bench

module tb;
reg rst,clk;
wire [3:0]count;
counter dut(rst,clk,count);
always #5 clk = ~clk;

initial begin 
	$monitor("Time = %0t  rst = %b  count=%d",$time,rst,count);
clk=0;
rst=1;
#13 rst=0;
#400 $finish;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


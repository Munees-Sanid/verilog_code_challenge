// design code for up counter

module counter(
	input rst,clk,updown,
	output [2:0]count);
reg [2:0]temp;
always@(posedge clk)begin
	if(rst)
		temp<=0;
	else if(updown)
		temp<=temp+1;
	
	else 
		temp<=temp-1;
	
		
	end
	assign count = temp;
endmodule

// test bench

module tb;
reg rst,clk,updown;
wire [2:0]count;
counter dut(rst,clk,updown,count);
always #5 clk = ~clk;
initial begin
$monitor("rst =%b updown=%b ::   count =%d ",rst,updown,count);
clk=0;
rst=1;
#13 rst=0;
updown=1;
 #70 updown=0;
#70 $finish;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


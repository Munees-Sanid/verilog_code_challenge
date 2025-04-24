// design code for counter

module counter(
	input rst,clk,
	output [2:0]count);
reg [2:0]temp;
always@(posedge clk)begin
	if(rst)
		temp<=0;
	else if(temp==5)
	
	else 
		temp<=temp+1;
	
		
	end
	assign count = temp;
endmodule

// test bench

module tb;
reg rst,clk;
wire [2:0]count;
counter dut(rst,clk,count);
always #5 clk = ~clk;
initial begin
$monitor("rst =%b  ::   count =%b ",rst,count);
clk=0;
#6 rst=1;
#13 rst=0;
#200 $finish;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


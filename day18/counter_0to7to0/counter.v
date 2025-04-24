// design code for counting 0 to 7 and 7 to 0

module counter(
	input clk,c,
	output reg [2:0]count);
reg [2:0]temp=0;
always @ (posedge clk)begin
	if(c==0)begin
		if(temp<7)
			temp<=temp+1;
	end else if(c==1)begin
		if(temp>0)
			temp<=temp-1;
		end	
count<=temp;
	end
 
endmodule


//  test bench

module tb;
reg c,clk;
wire [2:0]count;
counter dut(clk,c,count);
always #5 clk =~clk;
initial begin
$monitor("time = %0t ::  count =%d",$time,count);
clk=0;
c=0;
#90 c=1;
#90 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


// design for jk latch
module latch(
	input rst,clk,j,k,
	output reg q);
reg temp;
always@(rst,clk,j,k)begin
	if(clk)
		if(rst)
			temp=0;
		else case({j,k})

			2'b00 : temp=temp;
			2'b01 : temp=0;
			2'b10 : temp=1;
			2'b11 : temp=~temp;
		endcase
	q=temp;
	end
endmodule


// test bench for jk latch

module tb;
reg rst,clk,j,k;
wire q;
latch dut(rst,clk,j,k,q);
always  #5 clk=~clk;
initial begin 
$monitor("rst=%b  clk =%b  ::  j=%b   k=%b  :: q=%b",rst,clk,j,k,q);
clk=0;
for(integer i =0 ; i<2**3;i=i+1)begin
rst=1;
#5 rst=0;
{j,k}=i; #5; end
# 300 $finish;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

// code for dff

module dff(
	input d,clk,rst,
	output reg q);
always @(posedge clk)begin
	if(rst)
		q<=0;
	else
		q<=d;
end
endmodule

// test bench

module tb;
reg d,clk,rst;
wire q;
dff dut(d,rst,clk,q);
always #5 clk = ~ clk;
initial begin 
$monitor ("d=%b clk=%b rst=%b :: q=%b",d,clk,rst,q);
clk=0;
#6 rst=1;
#13 rst=0;
d=0;
#10 d=1 ;
#10 d=0;
#10 d=1;
#10 d=0;
#20 $finish;
end
initial begin
$dumpfile ("dump.vcd");
$dumpvars(0,tb);
end
endmodule

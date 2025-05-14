`include"design.v"
// test bench
module tb;
reg clk,rst;
wire [2:0]count;
counter dut(.*);
initial begin
$monitor("time = %0t  count = %d",$time,count);
clk=0;
rst=0;
#12 rst=1;

#120 $finish;
end
always #5 clk =~clk;
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

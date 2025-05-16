`include"design.v"
// test bench
module tb;
reg updown,clk,rst;
wire [2:0]count;
moore dut(.*);
initial begin
$monitor("time = %0t updown = %b count = %d",$time,updown,count);
clk=0;
rst=0;
#12 rst=1;
updown=1;
#60 updown=0;
#30 updown=1;
#30 $finish;
end
always #5 clk =~clk;
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

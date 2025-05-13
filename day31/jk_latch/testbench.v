`include"design.v"

 // testbench 
 
 module tb;
 reg j,k,clk,rst;
 wire q;
jk_latch dut(j,k,clk,rst,q);
always #5 clk = ~ clk;
initial begin
clk=0;
rst=0;  // asserting the reset 
#7 rst=1; // deasserting the reset 
{j,k}=0;
#10 {j,k}=1;
#7 {j,k}=2;
#8 {j,k}=3;
#9 {j,k}=2;
#2 rst=0;
#10 rst=1;
#2 {j,k}=3;
#10 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

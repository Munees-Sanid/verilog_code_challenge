`include"design.v"
module tb;
reg rst;
wire clk;
clk_gen dut(rst,clk);
initial begin
rst=1;
#5 rst=0;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

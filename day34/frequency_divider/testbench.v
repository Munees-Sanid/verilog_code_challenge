`include"design.v"
module tb;
reg rst,clk_in;
wire clk_out;
defparam dut.n=5;
divider dut(rst,clk_in,clk_out);
initial begin
clk_in=0;
rst=1;
#12 rst=0;
#200 $finish;
end
always #5 clk_in=~clk_in;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


// generate clock of 3ns time period
`timescale 1ns/1ps
module tb;
reg clk;
always #1.5 clk=~clk;
initial begin
clk=0;
#200 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

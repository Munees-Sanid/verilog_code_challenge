//  clock
`timescale 1ns/1ps
module test;
reg clk1;
reg clk2;
real time_period=10;

always #(time_period/2)clk1=~clk1;
always #(time_period/2)clk2=~clk2;

initial begin
clk1=0;
#5 clk2=0;
#500 $finish;
end


initial begin
$dumpfile("dump.vcd");
$dumpvars(0,test);

end
endmodule

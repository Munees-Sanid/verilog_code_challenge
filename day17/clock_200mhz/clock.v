// 200 MHZ clock
`timescale 1ns/1ps
module test;
reg clk;
real freq=200;
real time_period;
initial begin
clk=0;
time_period=(1/freq)*1000;
#500 $finish;
end
always #(time_period/2)clk=~clk;

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,test);

end
endmodule

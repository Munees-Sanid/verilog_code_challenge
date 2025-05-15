// test bench

`include"design.v"
 
module tb;

reg clk;
reg rst;
reg [1:0]control;
reg [3:0]data_in;
reg si_left;
reg si_right;
wire [3:0]q;

universal_shift_registor dut(   clk,
				rst,
				control,
				data_in,
				si_left,
				si_right,
				q);

initial begin
$monitor("time=%0t rst = %b control = %b si left = %b  si right = %b temp = %b ::  q=%b ",$time, rst,control, si_left,si_right,dut.temp,q);
clk=0;
rst=1;
control=2'b00;
data_in=4'b1010;
si_left=0;
si_right=1;
#12 rst=0;

control=2'b11 ;
#10; control=2'b01 ; si_right=1;
#10 ; control=2'b10 ; si_left=0;
#20 $finish;
end
always #5 clk=~clk;
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule



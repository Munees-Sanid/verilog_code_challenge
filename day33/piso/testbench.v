`include"design.v"
// test bench 

module tb;
reg load,clk,rst;
reg [3:0]sin;
wire q;
piso dut(.*);
initial begin
$monitor("time=%0t temp = %b :: serial out  = %b",$time,dut.temp,q);
clk=0;
rst=1;
load=0;
sin=4'b0000;
#12 rst =0;
load= 1 ; sin = 4'b1010;
#10 load =0;
#100 $finish;
end
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


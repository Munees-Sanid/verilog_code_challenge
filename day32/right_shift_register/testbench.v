// test bench
`include"design.v"
module tb;
reg rst,clk,si;
wire [3:0]q;
register dut(rst,clk,si,q);
initial begin
$monitor("time = %0t rst=%b si=%b :: q=%b",$time,rst,si,q);
clk=0;
rst=1;
#12 rst=0;
si=0;
#10 si=1;
#10 si=1;
#10 si=0;
#10 si=1;
#10 si=0;
#10 si=1;
#10 si=0;
#10 si=1;
#20 $finish;
end
always #5 clk =~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

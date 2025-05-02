//test bench
`include"design.v"
module tb;
reg rst,clk;
wire [6:0]count;

counter dut(rst,clk,count);

always #5 clk=~clk;

initial begin
$monitor("Sim=%0t rst=%b counter=%d",$time,rst,count);
clk=0;
rst=1;
#13 rst=0;
#2000 $finish;
end
 
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


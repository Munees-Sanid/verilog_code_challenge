`include"design.v"
module tb;
reg rst,clk,in;
wire y;
fsm dut(rst,clk,in,y);
always #5 clk= ~clk;
initial begin 
$monitor(" sim = %0t in=%b :: y=%b state = %d",$time,in,y,dut.state);
clk=0;
rst=1; 
in=0;
#10 rst=0;
#10 in=1;
#10 in=0;
#10 in=1;
#10 in =1;
#10 in =0;
#10 in =1;
#10 $finish;
end
initial begin
 $dumpfile("dump.vcd");
 $dumpvars(0,tb);
 end
 endmodule

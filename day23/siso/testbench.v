// test bench
`include"design.v"
module tb;
reg clk,rst,s_in;
wire s_out;
siso dut(clk,rst,s_in,s_out);
always #5 clk =~clk;
initial begin
$monitor("Sim =%0t rst=%b s_in =%b  shift_register=%b  ::  s_out=%b",$time,rst,s_in,dut.shift_register,s_out);
clk=0;
rst=1;
#10 rst =0;

#5 s_in=1;
#10 s_in=0;
#10 s_in=1;
#10 s_in=0;
#10 s_in=1;
#10 s_in=1;
#10 s_in=0;
#10 $finish;
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

`include"design.v"
// test bench
module tb;
reg in_seq,clk,rst;
wire out;
mealy dut(.*);
initial begin
$monitor("time = %0t in_sequence = %b out = %b",$time,in_seq,out);
clk=0;
rst=0;
#12 rst=1;
in_seq=1;
#10 in_seq=0;
#10 in_seq=1;
#10 in_seq=0;
#10 in_seq=1;
#10 in_seq=0;
#10 in_seq=1;
#20 $finish;
end
always #5 clk =~clk;
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

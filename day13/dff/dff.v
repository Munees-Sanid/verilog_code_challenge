// dff using 2x1 mux

module mux(
	input i0,i1,s,
	output y);
assign y = s?i1:i0;
endmodule


// d latch

module latch(
	input d,clk,
	output q);
wire q_t;
mux m1(q_t,d,clk,q_t);
assign q=q_t;
endmodule



// test bench

module tb;

reg d,clk;
wire q;
latch dut(d,clk,q);
always #5 clk =~clk;
initial begin 
$monitor(" d =%b   clk = %b   ::   q =%b  ",d,clk,q);
end
initial begin
clk=0;
d=1;
#6 d=0;
#7 d=1;
#4 d=1;
# 3 d=0;
#50 $finish;
end

// dumpfile
initial begin

$dumpfile("dump.vcd");
$dumpvars(0,tb);
end

endmodule

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

initial begin 
$monitor(" d =%b   clk = %b   ::   q =%b  ",d,clk,q);
clk=0;
# 5 clk =1;
d=0;
#5 d=1;
end
endmodule

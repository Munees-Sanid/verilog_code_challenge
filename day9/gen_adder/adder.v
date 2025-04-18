// To design generic adder
module adder #(parameter n=4)(
	input [n-1:0]a,b,
	output [n:0]s);
assign s=a+b;

endmodule


// test bench
module tb;
reg[15:0]a,b;
wire[16:0]s;
adder #(n) dut(a,b,s);
defparam dut.n=16;
initial begin 
$monitor("a = %d b = %d   ::  sum  = %d",a,b,s);
a = 1500 ; b =150;
#5 a = 201 ; b =1799;
end
endmodule

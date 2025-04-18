// bcd to excess 3

module bcd(
	input [3:0]b,
	output [3:0]e);
wire [9:0]w;
//e3
and a1(w[0],b[2],b[1]);
and a2(w[1],b[2],b[0]);
or o1(e[3],b[3],w[0],w[1]);

// e2
not n1(w[2],b[2]);
not n2(w[3],b[1]);
not n3(w[4],b[0]);
and a3(w[5],w[2],b[1]);
and a4(w[6],w[2],b[0]);
and a5(w[7],b[2],w[3],w[4]);
or r2(e[2],w[5],w[6],w[7]);

//e1
and a6(w[8],b[1],b[0]);
and a7(w[9],w[3],w[4]);
or r3(e[1],w[8],w[9]);

// e0
buf b1(e[0],w[4]);

endmodule



// test bench

module tb;
reg [3:0]b;
wire [3:0]e;
bcd dut(b,e);

initial begin
$monitor(" b = %b (%d)   ::  e =%b (%d)", b,b,e,e);
for (integer i = 0 ;i<10;i=i+1)begin
b=i ; #5;
end
end

initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


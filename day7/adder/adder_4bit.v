//4 bit adder
`include "fulladder.v"
module adder(
	input [3:0]a,b,
	input cin,
	output [3:0]s,
	output cout);
wire [2:0]c;
FA f1(a[0],b[0],cin,s[0],c[0]);
FA f2(a[1],b[1],c[0],s[1],c[1]);
FA f3(a[2],b[2],c[1],s[2],c[2]);
FA f4(a[3],b[3],c[2],s[3],cout);
endmodule




// test bench for 4 bit adder

module tb1;

reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;
adder dut(a,b,cin,s,cout);
initial begin

//a=4'b1010 ; b=4'b0001; cin = 1'b0;
//#5 a=4'b1000 ; b=4'b0010; cin =1'b0;
//#5 a=4'b1010 ; b=4'b0010; cin =1'b0;
//#5 a=4'b0111 ; b=4'b0010; cin =1'b0;
for(integer i=0 ; i<2**8; i=i+1)begin
#5 {a,b,cin}=i;
end
end
initial begin
$monitor("a = %b   b = %b    cin=%b   ::  s = %b  cout = %b",a,b,cin,s,cout);
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb1);
end
endmodule

//test bench
`include"design.v"
module tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

bcd dut(a,b,cin,sum,cout);
	
initial begin
$monitor("a=%d b=%d cin=%d :: result in bcd = %d",a,b,cin,sum);
a=9; b=5; cin=0;
#10 a=1; b=7; cin=0;
#10 a=4; b=7; cin=0;
#10;
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


// full adder using behavioral statement
module fa(
	input a,b,cin,
	output reg sum,carry);
reg p;
always@(a or b or cin)begin
	p=a^b;
	sum=p^cin;
	carry=(a&b)|(p&cin);
	end
endmodule

// test bench 

module tb;
reg a,b,cin;
wire sum,carry;
fa dut(a,b,cin,sum,carry);
initial begin
$monitor("a =%b b=%b c=%b :: sum=%b carry =%b",a,b,cin,sum,carry);
for(integer i=0;i<2**3;i=i+1)begin
{a,b,cin}=i; #5; end
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


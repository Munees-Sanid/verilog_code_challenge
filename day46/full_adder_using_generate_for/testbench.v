// testbench for 4- bit adder
`include"design.v"

module tb;
reg [3:0]a;
reg [3:0]b;
reg cin;
wire [3:0]sum;
wire carry;
integer k;

adder dut(a,b,cin,sum,carry);

	initial begin 
	$monitor("a = %d, b = %d, cin = %d sum = %d, carry = %d", a,b,cin,sum,carry);

		for(k=0; k<2**9 ; k= k+1)
		begin

			{a,b,cin} = k ; #2;
		end
	end
endmodule

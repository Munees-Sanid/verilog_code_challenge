module Signed_divider (
    input signed [8:0] dividend,   
    input signed [8:0] divisor,  
	 input s,
    output signed [8:0] quotient,  
    output signed [8:0] remainder  
);
wire [8:0] W1, W2;
divider div (
.a(dividend),.b(divisor),.y1(W1),.y2(W2));
mux_2_to_1 mul0 (
.A(W1),.s(s),.out(quotient));
mux_2_to_1 mul1 (

.A(W2),.s(s),.out(remainder));
endmodule
module divider (
input [8:0] a,
input [8:0] b,
output [8:0] y1,
output [8:0] y2);

    assign y1 = a / b; // Perform division
    assign y2 = a % b;  // Compute remainder

endmodule

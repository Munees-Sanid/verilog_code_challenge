module xor_d(
input a,b,
output y );
assign y1 = ~(~a&b);
assign y2 = ~(a&~b);
assign y = ~(y1&y2);
endmodule

module parity( 
input a,b,c,
output odd,even);
assign odd= ~(a^b^c);
assign even =a^b^c;
endmodule


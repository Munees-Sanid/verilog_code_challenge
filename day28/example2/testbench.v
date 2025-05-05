module test;
integer a,b,c;
initial begin
a<=5;
a=6;
end
initial b<=a;
initial c<=b;
initial $strobe(a,b,c);
endmodule

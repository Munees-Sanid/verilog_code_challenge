module test;
integer a,b;
initial a=20;
initial b<=30;
initial a<=b;
initial $strobe(a,b);
endmodule

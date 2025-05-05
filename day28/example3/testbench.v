//case 1
/*
module test;
integer a,b,c;
initial begin
#0 
a<=b;
a=1;
b=2;
end
initial c<=b;
initial $strobe(a,b,c);
endmodule

case 2
module test;
integer a,b,c;
initial begin
#0 
a=1;
b=2;
a<=b;
end
initial c<=b;
initial $strobe(a,b,c);
endmodule
*/

// case 3

module test;
integer a,b,c;
initial begin 
a=1;
b=2;
a<=b;
end
initial c<=b;
initial $strobe(a,b,c);
endmodule

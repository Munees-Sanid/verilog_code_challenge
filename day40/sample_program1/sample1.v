module test;
reg[7:0] a=1,b=2,c=3,d=4;
real f=4.2;
initial begin

b=a;
$display(b);
c=b;
$display(c);
d=c;
$display(d);
a=d;
$display(a);
$display(f);
end
endmodule

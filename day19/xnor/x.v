/*
module test;
wire a=1'b1,b=1'b1,c=1'b0;
wire y1,y2,y;
xnor x1(y1,a,b);
xnor x2(y2,y1,c);
not n1(y,y2);
initial begin
#1
$display("a=%b b=%b c=%b y1=%b ::  y =%b",a,b,c,y1,y);
end
endmodule

*/

module test;
wire a=1'b1,b=1'b0,c=1'b1,d=1'b0,e=1'b1,f=1'b1,g=1'b1;
wire y,y1,y2,y3,y4,y5,y6,y7;

xnor x1(y1,a,b);
xnor x2(y2,c,d);
xnor x3(y3,y2,y1);
xnor x4(y4,e,f);
xnor x5(y5,y4,y3);
xnor x6(y7,g,y5);
not n2(y,y7);

xnor x7(y6,a,b,c,d,e,f,g);
initial begin
#10000
$display ("y = %b ",y);
$display("y6=%b",y6);
end
endmodule

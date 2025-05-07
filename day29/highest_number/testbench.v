module tb;
integer a,b,c;
initial begin
a=10;
b=20;
c=5;
end
always@(a,b,c)begin
if(a>b && a>c)
$display("A is greater");
if(b>a && b>c)
$display("B is greater");
else 
$display("C is the greater");
end
endmodule

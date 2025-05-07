// code to generate the right angled triangle pattern of *
module tb;
integer a,b;
initial begin
for(a=0; a<=4; a=a+1)begin

for(b=4; b>=0;b=b-1)begin
if(a>b) $write("*");
else $write(" ");
end
$write("\n");
end
end
endmodule

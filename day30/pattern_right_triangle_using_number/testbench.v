// code to generate the right angled triangle pattern of number
module tb;
integer a,b;
initial begin
for(a=0; a<5; a=a+1)begin

for(b=5; b>0;b=b-1)begin
if(a>b) $write(b);
else $write(" ");
end
$write("\n");
end
end
endmodule

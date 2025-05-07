// code to generate the right angled triangle pattern of number
module tb;
integer a,b;
initial begin
for(a=0; a<6; a=a+1)begin

for(b=1; b<a;b=b+1)begin

$write(b);
end
$write("\n");
end
end
endmodule

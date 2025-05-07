// code to generate the right angled triangle pattern of *
module tb;
integer a,b;
initial begin
for(a=0; a<5; a=a+1)begin

for(b=0; b<a;b=b+1)begin

$write("*");
end
$write("\n");
end
end
endmodule

module tb;
integer i,j,k;
initial begin
for(i=0;i<=10;i++)begin
for(j=1;j<=10-i;j++)begin
$write(" ");
end
for(k=1;k<=2*i-1;k++)begin
$write("*");
end
$display;
end



end
endmodule

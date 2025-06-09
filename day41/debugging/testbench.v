module tb;
integer i,j,k;
initial begin
for(i=5;i>=1;i--)begin
for(j=1;j<=5-i;j++)begin
$write(" ");
end
for(k=1;k<=i;k++)begin
$write("*");
end
$display;
end



end
endmodule

module tb;
initial begin
for(integer a=0; a<8;a=a+1)begin
for(integer b=0;b<a;b=b+1)begin
$write("*");
end
$write("\n");
end

end
endmodule



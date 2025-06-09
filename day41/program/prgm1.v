module tb;
integer a;
always@(*)
begin
a=a+1;
$display("a = %0d",a);
end
endmodule

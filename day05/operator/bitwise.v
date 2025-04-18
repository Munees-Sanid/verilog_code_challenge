// bitwise operation
module bitwise;
reg [3:0]a=4'b0101,b=4'b1100;
reg [3:0]y;
initial begin
$display("The bitwise and of a = %b   b = %b   ::   y =%b ", a,b,a&b);
$display("The bitwise or of a = %b   b = %b    ::   y =%b ", a,b,a|b);
$display("The bitwise xor of a = %b   b = %b   ::   y =%b ", a,b,a^b);
$display("The bitwise xnor of a = %b   b = %b  ::   y =%b ", a,b,~(a^b));
$display("The bitwise not of a = %b              ::   y =%b ", a,~a);
end
endmodule

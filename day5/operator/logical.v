// logical operation
module logical;
reg [3:0]a=4'b0101,b=4'b0000;
reg y;
initial begin
$display("The logical and of a = %b   b = %b   ::   y =%b ", a,b,a&&b);
$display("The logical or of a = %b   b = %b    ::   y =%b ", a,b,a||b);
$display("The logical not of a = %b              ::   y =%b ", a,!a);
end
endmodule

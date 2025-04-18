// shiftwise operation
module shiftwise;
reg [7:0]a=8'b0101;
reg [7:0]y;
initial begin
$display("The bitwise and of a = %b     ::   y =%b ", a,a<<3);
$display("The bitwise and of a = %b     ::   y =%b ", a,a>>1);
end
endmodule


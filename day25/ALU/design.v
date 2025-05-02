// design code for ALU
module alu (
	input [3:0]a,b,
	input [2:0]op,
	output reg [4:0]y);
always @(*)begin
case(op)
3'b000: y=a+b;
3'b001: y=a-b;
3'b010: y=a%b;
3'b011: y=a*b;
3'b100: y=a&b;
3'b101: y=a|b;
3'b110: y=a^b;
3'b111: y=~(a^b);
endcase
end
endmodule





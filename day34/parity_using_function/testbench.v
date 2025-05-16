`include"design.v"
module tb;
reg [7:0]din;
wire y;
parity dut(din,y);
initial begin
$monitor("din = %b :: y = %b",din,y);
din=8'b1001_1011;
#10 din=8'b1111_0011;
end
endmodule

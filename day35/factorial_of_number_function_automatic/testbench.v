`include"design.v"
module tb;
reg [31:0]N;
wire [63:0]facto;
factorial dut(N,facto);
initial begin
$monitor("sim=%0t    the factorial of %0d is %0d ",$time,N,facto);
N=4;
#20 N =6;
#10 N=5;
end
endmodule

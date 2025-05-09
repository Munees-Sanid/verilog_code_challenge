`include"design.v"
module tb;
reg a,b;
wire s,c;
adder dut(a,b,s,c);
initial begin
$monitor("sim=%0t  a = %b b = %b :: sum = %b carry = %b",$time,a,b,s,c);
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
end
endmodule

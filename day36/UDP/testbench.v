`include"/home/munees-sanid/github/verilog_code/day36/UDP/udp.v"
module tb;
reg a,b;
wire y;
xor_udp(y,a,b);
initial begin
$monitor("a = %b b =%b :: y=%b",a,b,y);
a=0; b=0;
#5 a=0; b=1;
#5 a=1; b=0;
#5 a=1; b=1;
end
endmodule


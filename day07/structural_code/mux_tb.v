`include"mux.v"
module tb;
reg [3:0]i;
reg [1:0]s;
wire y;
mux_41 dut(.*);
initial begin 
$monitor("a=%b s=%b :: y =%b",i,s,y);
for(integer j=0;j<2**6;j=j+1)begin
{i,s}=j; #5; end
end
endmodule

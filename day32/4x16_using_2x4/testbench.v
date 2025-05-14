// test bench
`include"design.v"
module tb;
reg [3:0]i;
wire [15:0]d;
decoder dut(i,d);
initial begin
$monitor("time=%0t i=%b d=%b ",$time,i,d);
for(integer j =0; j<2**4;j=j+1)begin
i=j;
#2;
end
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

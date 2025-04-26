`include"clock.v"
`include"lfsr.v"
module tb;
wire clk;
wire [7:0]q;
reg [7:0] count=0;
initial begin
    force tb.dut.q = 4'b0001; 
    #5 release tb.dut.q;       
end
lfsr dut(clk,q);
clock c1(clk);

always @(posedge clk) begin
count =count+1;
 end
 
initial begin 
$monitor("%d :: q = %b",count,q);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


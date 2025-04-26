`include"clock.v"
`include"lfsr.v"
module tb;
wire clk;
wire [7:0]q;
integer t_count=0;
reg [7:0] q1=0;
initial begin
    force tb.dut.q = 4'b0001; 
    #5 release tb.dut.q;       
end
lfsr dut(clk,q);
clock c1(clk);

always @(posedge clk) begin
if (q != q1) begin
t_count = t_count + 1;
q1 = q;
 end
 end
initial begin 
$monitor("%d :: q = %b",t_count,q);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


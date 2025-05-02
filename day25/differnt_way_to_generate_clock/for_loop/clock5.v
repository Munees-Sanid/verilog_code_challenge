module clock;
reg clk;
initial begin
clk=0;
for(integer i=0;i<20;i=i+1)
#5 clk = ~clk;
end

initial begin
$dumpfile("clock5.vcd");
$dumpvars(0,clk);
end

endmodule


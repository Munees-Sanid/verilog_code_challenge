module clock;
reg clk;
initial begin
clk=0;
while (1)
#5 clk = ~clk;
end

initial begin
#100 $finish;
end

initial begin
$dumpfile("clock4.vcd");
$dumpvars(0,clk);
end

endmodule


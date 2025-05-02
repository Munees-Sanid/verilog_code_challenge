module clock;
reg clk;
// using repeat block to generate clock pulse
initial begin
clk=0;
repeat(20) #5 clk =~clk;
end

initial begin
$dumpfile("clock3.vcd");
$dumpvars(0,clk);
end

endmodule


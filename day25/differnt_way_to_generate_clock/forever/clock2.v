module clock;
reg clk;
initial begin
clk=0;
// using forever block to generate clock pulse
forever #5 clk =~clk;
end
initial begin
#200 $finish; // $finish is neccessary to terminate infinite loop
end

initial begin
$dumpfile("clock2.vcd");
$dumpvars(0,clk);
end

endmodule

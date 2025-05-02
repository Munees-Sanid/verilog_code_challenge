module clock;
reg clk;
// using always block to generate clock pulse
always #5 clk =~clk;

initial begin
clk=0;
#200 $finish; // $finish is neccessary to terminate infinite loop
end

initial begin
$dumpfile("clock1.vcd");
$dumpvars(0,clk);
end

endmodule

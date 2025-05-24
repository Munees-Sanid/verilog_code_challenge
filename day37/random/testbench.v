module ring_counter (
    input clk,
    input reset,
    output reg [9:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 10'b11010_00000;            // Initialize with one '1' and rest '0's
    else
        q <= {~q[0],q[9:1]};    // Shift left circularly
end

endmodule

module tb;
reg clk, reset;
wire [9:0] q;

ring_counter uut(.clk(clk), .reset(reset), .q(q));

initial begin
    clk = 0; reset = 1;
    #10 reset = 0;
    #100 $finish;
end

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t q=%b", $time, q);
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


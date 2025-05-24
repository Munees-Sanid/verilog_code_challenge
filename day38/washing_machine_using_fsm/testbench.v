`include"design.v"

`timescale 1s/1ms


module WashingMachine_tb;

reg clk;
reg reset;
reg start;
wire [2:0] state;
wire done;
reg [80*8:1] state_str;

WashingMachine uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .state(state),
    .done(done)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, WashingMachine_tb);
end

initial begin
    clk = 0;
    forever #0.5 clk = ~clk;
end

initial begin
    reset = 1;
    start = 0;
    #2;
    reset = 0;
    #2;
    start = 1;
    #1;
    start = 0;
    wait (done);
    #5;
    $finish;
end

always @(*) begin
    case (state)
        3'b000: state_str = "IDLE";
        3'b001: state_str = "FILL";
        3'b010: state_str = "WASH";
        3'b011: state_str = "RINSE";
        3'b100: state_str = "DRAIN";
        3'b101: state_str = "SPIN";
        default: state_str = "UNKNOWN";
    endcase
end

initial begin
    $monitor("Time: %9t | State: %6s | Done: %4b", $time, state_str, done);
end

endmodule


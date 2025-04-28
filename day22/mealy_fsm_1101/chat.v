// Full Design and Testbench for Mealy FSM detecting 1101 sequence

module fsm(
    input clk, rst, in,
    output reg y
);
    // Define states using parameters
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] state, next_state;

    // State transition on clock edge or reset
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0; // Reset to state 0 explicitly
        else
            state <= next_state; // Transition to next state
    end

    // Next-state logic and output logic
    always @(*) begin
        // Default assignments to avoid latch
        next_state = s0;
        y = 0;

        case (state)
            s0: begin
                next_state = (in) ? s1 : s0;
                y = 0;
            end
            s1: begin
                next_state = (in) ? s2 : s0;
                y = 0;
            end
            s2: begin
                next_state = (in) ? s2 : s3;
                y = 0;
            end
            s3: begin
                next_state = (in) ? s1 : s0;
                y = (in) ? 1 : 0; // Output 1 when full 1101 sequence detected
            end
        endcase
    end
endmodule

// Testbench
module tb;
    reg rst, clk, in;   // Input signals
    wire y;             // Output signal

    // Instantiate the FSM module
    fsm dut(
        .rst(rst),
        .clk(clk),
        .in(in),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk; // 5-time unit clock period

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        in = 0;

        // Apply reset for 10 time units
        #10 rst = 0;

        // Apply the input sequence: 1101
        #10 in = 1;   // Apply first input (1)
        #10 in = 1;   // Apply second input (1)
        #10 in = 0;   // Apply third input (0)
        #10 in = 1;   // Apply fourth input (1)

        // Finish the simulation
        #10 $finish;
    end

    // Monitor the signals for debugging
    initial begin
        $monitor("Time=%0t, in=%b, y=%b, state=%b", $time, in, y, dut.state);
    end

    // VCD file for waveform generation
    initial begin
        $dumpfile("dump.vcd");  // Output VCD file
        $dumpvars(0, tb);       // Dump all variables
    end
endmodule


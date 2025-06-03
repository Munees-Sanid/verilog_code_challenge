`include"design.v"
module tb_master_slave_jk_ff;

    // Testbench signals
    reg clk;
    reg j;
    reg k;
    reg reset;
    wire q;

    // Instantiate the master_slave_jk_ff module
    master_slave_jk_ff uut (
        .clk(clk),
        .j(j),
        .k(k),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test procedure
    initial begin
        // Initialize inputs
        reset = 1; j = 0; k = 0;

        // Apply reset
        #10 reset = 0;
        
        // Test case 1: J = 0, K = 0 (No change)
        #10 j = 0; k = 0;
        #20;
        
        // Test case 2: J = 1, K = 0 (Set)
        #10 j = 1; k = 0;
        #20;
        
        // Test case 3: J = 0, K = 1 (Reset)
        #10 j = 0; k = 1;
        #20;
        
        // Test case 4: J = 1, K = 1 (Toggle)
        #10 j = 1; k = 1;
        #20;
        
        // Test case 5: Reset (Asynchronous reset)
        #10 reset = 1;
        #10 reset = 0;
        #20;
        
        // Finish simulation
        #50 $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | J = %b | K = %b | Reset = %b | Q = %b", $time, j, k, reset, q);
    end

endmodule

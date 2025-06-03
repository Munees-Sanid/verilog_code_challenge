module master_slave_jk_ff (
    input wire clk,    // Clock signal
    input wire j,      // J input
    input wire k,      // K input
    input wire reset,  // Asynchronous reset
    output reg q       // Output Q
);

    reg master_q;  // Master flip-flop output

    // Master flip-flop (active on rising edge of clk)
    always @(posedge clk or posedge reset) begin
        if (reset) 
            master_q <= 0;  // Reset to 0
        else begin
            case ({j, k})
                2'b00: master_q <= master_q; // No change
                2'b01: master_q <= 0;        // Reset
                2'b10: master_q <= 1;        // Set
                2'b11: master_q <= ~master_q;// Toggle
            endcase
        end
    end

    // Slave flip-flop (active on falling edge of clk)
    always @(negedge clk or posedge reset) begin
        if (reset) 
            q <= 0;  // Reset to 0
        else 
            q <= master_q; // Slave follows master on falling edge
    end

endmodule

// design code for washing machine using fsm 
module WashingMachine (
    input clk,
    input reset,
    input start,
    output reg [2:0] state,
    output reg done
);

parameter IDLE  = 3'b000,
          FILL  = 3'b001,
          WASH  = 3'b010,
          RINSE = 3'b011,
          DRAIN = 3'b100,
          SPIN  = 3'b101;

parameter FILL_TIME  = 2,
          WASH_TIME  = 20,
          RINSE_TIME = 10,
          DRAIN_TIME = 3,
          SPIN_TIME  = 5;

reg [4:0] timer;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        timer <= 0;
        done <= 0;
    end else begin
        case (state)
            IDLE: begin
                done <= 0;
                timer <= 0;
                if (start) state <= FILL;
            end

            FILL: begin
                if (timer == FILL_TIME) begin
                    timer <= 0;
                    state <= WASH;
                end else
                    timer <= timer + 1;
            end

            WASH: begin
                if (timer == WASH_TIME) begin
                    timer <= 0;
                    state <= RINSE;
                end else
                    timer <= timer + 1;
            end

            RINSE: begin
                if (timer == RINSE_TIME) begin
                    timer <= 0;
                    state <= DRAIN;
                end else
                    timer <= timer + 1;
            end

            DRAIN: begin
                if (timer == DRAIN_TIME) begin
                    timer <= 0;
                    state <= SPIN;
                end else
                    timer <= timer + 1;
            end

            SPIN: begin
                if (timer == SPIN_TIME) begin
                    timer <= 0;
                    state <= IDLE;
                    done <= 1;
                end else
                    timer <= timer + 1;
            end

            default: begin
                state <= IDLE;
                timer <= 0;
                done <= 0;
            end
        endcase
    end
end

endmodule


module fsm_ex(
    input  clk,
    input  x,
    input  rst,
    output reg z
);
    localparam s0 = 1'b0;
    localparam s1 = 1'b1;

    reg state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= s0; 
        end else begin
            state <= next_state; 
        end
    end
    always @(*) begin
        next_state = state;
        z = 0; 

        case(state)
            s0: begin
                if (x == 1) begin
                    next_state = s1;
                    z = 1;
                end else begin
                    next_state = s0;
                    z = 0;
                end
            end
            s1: begin
                if (x == 1) begin
                    next_state = s0;
                    z = 0; 
                end else begin
                    next_state = s1;
                    z = 1;
                end
            end
            default: begin
                next_state = s0;
                z = 0; 
            end
        endcase
    end
endmodule

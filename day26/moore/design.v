module moore_1011_detector (
    input clk,
    input rst,
    input in,
    output reg out
);

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
       
reg [2:0] state, next_state;

 always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

 always @(*) begin
        case (state)
            S0: 
            begin 
            next_state = (in == 1) ? S1 : S0;
            out =0;
            end
            S1:
            begin next_state = (in == 0) ? S2 : S1;
            out=0;
            end
            
            S2:
            begin next_state = (in == 1) ? S3 : S0;
            out=0;
            end
            S3:
            begin next_state = (in == 1) ? S4 : S2;
            out=0;
            end
            S4:
            begin next_state = (in == 1) ? S1 : S2;
            out=1;
            end
            
        endcase
    end
 
endmodule


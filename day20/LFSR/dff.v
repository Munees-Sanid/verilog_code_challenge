// design code for d flip flop without reset
module dff (
    input d, 
    input clk, 
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule


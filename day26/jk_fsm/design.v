  module jkff_fsm(
    input clk,j,k,rst,
    output q
);
    wire NS,S;
    DFF D0(NS,clk,rst,s);
    assign NS = (j&~q)|(~k&q);//NS logic
    assign q=s;//output logic 
endmodule 
  module DFF (
    input wire D,
    input wire clk,      
    input wire reset,   
    output reg Q        
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b0;   
        end else begin
            Q <= D;      
        end
    end

endmodule

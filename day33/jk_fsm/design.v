module jk_fsm(
    input j,k,clk,rst,
    output reg q
);

    parameter s0=1'b0;  
    parameter s1=1'b1;  
    
    reg ps,ns; 
    
    always @(posedge clk or negedge rst) begin
        if (!rst)
            ps<=s0;  
        else
            ps<=ns;  
    end
    

    always @(j,k,ps) begin
        case(ps)
            s0: begin
                ns=(j)?s1:s0;
                q=1'b0;
            end
     
            s1: begin
                ns=(k)?s0:s1;
                q=1'b1;
            end
            
            default: begin
                ns=s0;
                q=1'b0;
            end
        endcase
    end
endmodule

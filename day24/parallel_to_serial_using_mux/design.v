// parallel to serial using mux

module mux_p(
    input  clk,               
    input [3:0] parallel_in, 
    output reg serial_out        
);

    reg [1:0] count = 0;          

    always @(posedge clk) begin
        case (count)
            2'b00: serial_out <= parallel_in[0];
            2'b01: serial_out <= parallel_in[1];
            2'b10: serial_out <= parallel_in[2];
            2'b11: serial_out <= parallel_in[3];
        endcase
        count <= count + 1;
    end

endmodule





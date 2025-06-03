module PIPO (
  input wire clk,
  input wire reset,         
  input wire load,          // Load control signal
  input wire [7:0] pdata,  
  output reg [7:0] q        
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      q <= 8'b00000000;      
    end else if (load) begin
      q <= pdata;            // Load input data into output on load
    end
  end

endmodule

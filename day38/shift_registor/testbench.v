`include"design.v"
module shift_register_tb;
  parameter N = 8;  

  reg clk;
  reg reset;
  reg S_in;


  wire S_out;
  shift_register #(N) uut (
    .clk(clk), 
    .reset(reset), 
    .S_in(S_in), 
    .S_out(S_out)
  );
  always #5 clk = ~clk;  

  initial begin
    clk = 0;
    reset = 0;
    S_in = 0;
    #5 reset = 1;   
    #10 reset = 0; 

   
    S_in = 1; #10;  // Shift in '1'
    S_in = 0; #10;  // Shift in '0'
    S_in = 1; #10;  // Shift in '1'
    S_in = 0; #10;  // Shift in '0'
    S_in = 1; #10;  // Shift in '1'

    #50 $finish;
  end
      
endmodule

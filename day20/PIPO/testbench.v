`include"design.v"
module PIPO_tb;
  reg clk;
  reg reset;
  reg load;
  reg [7:0] pdata;
  wire [7:0] q;
  PIPO uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .pdata(pdata),
    .q(q)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;   
  end
  initial begin
    $dumpfile("dump.vcd");   
    $dumpvars(0, PIPO_tb);  

    // Initialize signals
    reset = 1;
    load = 0;
    pdata = 8'b10101010
    #10 reset = 0;
    #10 load = 1;        
    #10 load = 0;        
    pdata = 8'b11001100;  
    #10 load = 1;          
    #10 $finish;
  end
endmodule

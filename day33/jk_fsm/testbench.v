`include"design.v"
module jk_fsm_tb;
  reg clk, rst, j, k;
  wire q;
  jk_fsm dut(
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;
    j = 0;
    k = 0;
    #10 rst = 0;    
    #10 j = 0; k = 0; 
    #10 j = 0; k = 1;  
    #10 j = 1; k = 0;  
    #10 j = 1; k = 1; 
    #10 j = 0; k = 0;  
    #10 j = 1; k = 1;  
    #10 j = 1; k = 1;  
    #10 j = 0; k = 1;  
    #10 j = 1; k = 0;        
    #10 $finish;
  end
  initial begin
    $monitor("Time = %0t, Reset = %b, J = %b, K = %b, Q = %b", 
             $time, rst, j, k, q);
  end
  initial begin
    $dumpfile("jk_fsm_tb.vcd");
    $dumpvars(0, jk_fsm_tb);
  end
  
endmodule

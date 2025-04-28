module Tlatch(T,clk,reset,Q);
  input T,clk,reset;
  output reg Q;
  reg temp;
  always@(clk,T,reset)
    begin
      if(!clk)
        if(reset)
          temp=0;
      else
        if(T)
          temp=~temp;
      else
        temp=temp;
      Q=temp;
    end
endmodule


module Tlatch_tb;
  reg T,clk,reset;
  wire Q;
  Tlatch dut(T,clk,reset,Q);
  initial begin
    clk=1;
   forever #5 clk=~clk;
  end
  initial begin
    reset=0; T=0;
    #5 reset=1; T=1;
    #5 reset=0; T=0;
    #5 reset=0; T=1;
    #5 reset=0; T=1;
    
    #20 $finish;
  end
  initial begin
    $monitor("Sim time=%0t,T=%b,reset=%b,Q=%b",$realtime,T,reset,Q);
             end
             initial begin
               $dumpfile("dump.vcd");
               $dumpvars();
             end
             endmodule

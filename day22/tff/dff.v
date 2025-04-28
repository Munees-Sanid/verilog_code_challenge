module dff(clk,d,Q);
  input clk;
  input d;
  output reg Q;
  always@(posedge clk)
    begin
      Q<=d;     //// On rising edge of clock, Q takes value of D
    end
endmodule

module dff_tb;
  reg clk,d;
  wire Q;
  dff dut(d,clk,Q);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    d=0;
    #10 d=1;
    #10 d=0;
     #10 d=1;

    #20 $finish;
  end
  initial begin
    $monitor("Sim time=%0t,clk=%b,d=%b,Q=%b",$time,clk,d,Q);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dff_tb);
  end
endmodule

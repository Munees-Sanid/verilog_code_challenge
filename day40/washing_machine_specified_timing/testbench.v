
`include"design.v"
module tb;

reg clk;
reg reset;
reg start;
wire beep;
wire [2:0] state;

washing_machine wm(clk, reset, start, beep, state);

initial begin
  clk = 0;
  forever #1 clk = ~clk;
end

initial begin
  reset = 1;
  start = 0;
  #5;
  reset = 0;
  
  #5;
  start = 1;
  #2;
  start = 0;

  #40;
  start = 1;
  #2;
  start = 0;

  #50;
  reset = 1;
  #2;
  reset = 0;

  #10;
  start = 1;
  #3;
  start = 0;

  #200;
  start = 1;
  #1;
  start = 0;

  #100;
  $finish;
end

initial begin
  $monitor("time=%3t, state=%2d, beep=%2b", $time, state, beep);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule



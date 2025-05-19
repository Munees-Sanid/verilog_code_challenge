`include"gate.v"
module tb;
  reg a, b;
  wire y;

  gate dut(y, a, b);

  initial begin
    $display("a b | y");
    a = 0; b = 0; #1 $display("%b %b | %b", a, b, y);
    a = 0; b = 1; #1 $display("%b %b | %b", a, b, y);
    a = 1; b = 0; #1 $display("%b %b | %b", a, b, y);
    a = 1; b = 1; #1 $display("%b %b | %b", a, b, y);
  end
endmodule


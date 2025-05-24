module clock(output reg clk);
  always #6 clk = ~clk;

  initial begin
    clk = 0;
    #200 $finish;
  end
endmodule

module tb;

  wire clk;
  clock d1(clk);

  time a, b, tp;
  reg flag = 0;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, clk);
  end

  always @(posedge clk) begin
    if (!flag) begin
      a = $time;
      flag = 1;
    end
  end

  always @(posedge clk) begin
    if (flag) begin
      b = $time;
      tp = b - a;
      $display("Time period is %0t", tp);  // should print 12
      $finish;
    end
  end

endmodule


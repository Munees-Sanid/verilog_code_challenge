module tb;
initial begin
  fork
    $display("th2");
    $display("th1");
  join
end
endmodule



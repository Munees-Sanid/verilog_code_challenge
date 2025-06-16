module tb;
initial begin
  fork
   #1 $display("th1");
   #1  $display("th2");
  join
end
endmodule



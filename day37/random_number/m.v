module tb;
integer i,j;
initial begin
for (i = 0; i < 3; i = i + 1) begin
  for (j = 0; j < 2; j = j + 1) begin
    $display("i = %0d, j = %0d", i, j);
  end
end
end
endmodule

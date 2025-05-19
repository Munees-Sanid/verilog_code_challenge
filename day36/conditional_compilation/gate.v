module gate(output y, input a, b);

`ifdef AND
  assign y = a & b;
`elsif OR
  assign y = a | b;
`else
  assign y = a ^ b;
`endif

endmodule

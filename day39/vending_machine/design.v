module vending (
  input clk, reset,
  input five, ten,
  output reg dispense
);

  parameter S0 = 2'b00, S5 = 2'b01, S10 = 2'b10, S15 = 2'b11;
  reg [1:0] state, next_state;

  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= S0;
    else
      state <= next_state;
  end

  always @(*) begin
    case (state)
      S0:  next_state = five ? S5 : (ten ? S10 : S0);
      S5:  next_state = five ? S10 : (ten ? S15 : S5);
      S10: next_state = five ? S15 : (ten ? S15 : S10);
      S15: next_state = S0;
      default: next_state = S0;
    endcase
  end

  always @(*) begin
    dispense = (state == S15);
  end

endmodule


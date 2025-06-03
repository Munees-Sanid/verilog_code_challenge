module elevator (
  input clk, reset,
  input go0, go1, go2,
  output reg [1:0] floor
);

  parameter G = 2'b00, F1 = 2'b01, F2 = 2'b10;
  reg [1:0] state, next_state;

  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= G;
    else
      state <= next_state;
  end

  always @(*) begin
    case (state)
      G:  next_state = go1 ? F1 : (go2 ? F2 : G);
      F1: next_state = go0 ? G : (go2 ? F2 : F1);
      F2: next_state = go0 ? G : (go1 ? F1 : F2);
      default: next_state = G;
    endcase
  end

  always @(*) begin
    floor = state;
  end

endmodule


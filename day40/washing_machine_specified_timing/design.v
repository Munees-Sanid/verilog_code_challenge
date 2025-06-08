module washing_machine(clk, reset, start, beep, state_out);
input clk, reset, start;
output reg beep;
output [2:0] state_out;

reg [2:0] state, next_state;
reg [7:0] timer;

assign state_out = state;

parameter IDLE = 3'd0;
parameter FILL = 3'd1;
parameter WASH = 3'd2;
parameter RINSE = 3'd3;
parameter DRAIN = 3'd4;
parameter SPIN = 3'd5;
parameter DONE = 3'd6;

parameter FILL_TIME = 2;
parameter WASH_TIME = 20;
parameter RINSE_TIME = 10;
parameter DRAIN_TIME = 3;
parameter SPIN_TIME = 5;
parameter BEEP_TIME = 30;

always @(posedge clk or posedge reset)
begin
  if (reset) begin
    state <= IDLE;
    timer <= 0;
  end else begin
    if (state != next_state)
      timer <= 0;
    else
      timer <= timer + 1;
    state <= next_state;
  end
end

always @(*)
begin
  case(state)
    IDLE: if (start) next_state = FILL; else next_state = IDLE;
    FILL: if (timer >= FILL_TIME) next_state = WASH; else next_state = FILL;
    WASH: if (timer >= WASH_TIME) next_state = RINSE; else next_state = WASH;
    RINSE: if (timer >= RINSE_TIME) next_state = DRAIN; else next_state = RINSE;
    DRAIN: if (timer >= DRAIN_TIME) next_state = SPIN; else next_state = DRAIN;
    SPIN: if (timer >= SPIN_TIME) next_state = DONE; else next_state = SPIN;
    DONE: if (timer >= BEEP_TIME) next_state = IDLE; else next_state = DONE;
    default: next_state = IDLE;
  endcase
end

always @(posedge clk or posedge reset)
begin
  if (reset)
    beep <= 0;
  else
    beep <= (state == DONE);
end

endmodule


// design code for mealy fsm 1101

module fsm(
	input clk,rst,in,
	output reg y);
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0]state,next_state;
always@(posedge clk or posedge rst)begin
if(rst)
	state<=s0;
else
	state<=next_state;
end
always @(*)begin
next_state=s0;
y=0;
case(state)
s0: begin
	next_state=(in)?s1:s0;
	y=0;
	end
s1: begin
	next_state=(in)?s2:s0;
	y=0;
	end
s2: begin
	next_state=(in)?s2:s3;
	y=0;
	end
s3: begin
	next_state=(in)?s1:s0;
	y=(in)?1:0;
	end
default: begin
    next_state = s0;
     y = 0;
end
endcase
end
endmodule



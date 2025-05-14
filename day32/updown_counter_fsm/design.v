// updown counter
module counter(
	input clk,rst,
	output reg [2:0]count);

reg [2:0] ps,ns;

parameter s0=3'b000;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s7=3'b111;

always@(posedge clk)
begin 
	if(~rst)
		ps<=s0;
	else
		ps<=ns;
end

always @(ps)begin
case(ps)
s0: ns=s2;
s2: ns=s3;
s3: ns=s7;
s7: ns=s0;


endcase
end
always@(ps)begin
count=ps;
end
endmodule

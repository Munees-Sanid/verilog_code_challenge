// design code for mod-100 counter

module counter(
	input rst,clk,
	output [6:0]count);
reg [6:0]temp;
always @ (posedge clk)begin
	if(rst)
		temp<=0;
	else if(temp==100)
		temp<=0;
	else
		temp<=temp+1;
	end
assign count=temp;

endmodule



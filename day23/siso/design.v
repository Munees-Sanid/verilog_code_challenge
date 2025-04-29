// design code for serial in serial out

module siso(
	input clk,rst,s_in,
	output s_out);
reg [3:0]shift_register;
always@(posedge clk or posedge rst)begin
	if(rst)
		shift_register<=0;
	else 
		shift_register<={shift_register[2:0],s_in};
	end
assign s_out = shift_register[3];
endmodule



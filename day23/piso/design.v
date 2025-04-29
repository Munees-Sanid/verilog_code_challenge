// design code for parallel in and serial out 

module piso(
	input rst,clk,load,
	input [3:0]parallel_in,
	output s_out);
reg [3:0]shift_register;
always@(posedge clk or posedge rst)begin
	if(rst)
		shift_register<=0;
	else if(load)
		shift_register <= parallel_in;
	else
		shift_register <= { shift_register[2:0], 1'b0};
	end
assign s_out=shift_register[3];
endmodule




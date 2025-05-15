//  design code for piso 

module piso(
	input load,clk, rst,
	input [3:0]sin,
	output q);
reg [3:0]temp;
always@(posedge clk)begin
	if(rst)
	 	temp<=0;
	 else if (load)
	 	temp<=sin;
	 else 
	 	temp<={1'bx,temp[3:1]};
	end
assign q = temp[0];
endmodule



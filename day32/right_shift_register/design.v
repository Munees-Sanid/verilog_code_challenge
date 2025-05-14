// design for right shift register for sipo

module register(
	input rst,clk,si,
	output [3:0]q);
reg [3:0]temp;
assign q=temp;
	always@(posedge clk or posedge rst)
		begin
			if(rst)
				temp<=4'b0000;
			else
				temp<={si,temp[3:1]};
			end
endmodule

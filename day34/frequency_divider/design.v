module divider #(parameter integer n=3)(
	input rst,clk_in,
	output clk_out
	);
reg temp_clk;
integer count;
always@(posedge clk_in or negedge clk_in)
begin
	if(rst)
	begin
		count=0;
		temp_clk=0;
		end
	else
		count=count+1;
		
	if(count == n)
	begin
		temp_clk = ~temp_clk;
		count=0;
	end

end
assign clk_out=temp_clk;
endmodule
		

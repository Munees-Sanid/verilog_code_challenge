module jk_latch(
	input j,k,clk,rst,
	output q);
 reg temp;
 assign q=temp;
 always@(j,k,clk,rst)begin
 begin 
 	if(~rst)
 	temp<=0;
 	else 
 		if(clk)
 			case({j,k})
 			2'b00 : temp<=temp;
 			2'b01 : temp<=0;
 			2'b10 : temp<=1;
 			2'b11 : temp<=~temp;
 			endcase
 		else 
 		temp<=temp;
 	end
 	end
 endmodule
 
 


// design code for universal shift registor

module universal_shift_registor(
	input clk,
	input rst,
	input [1:0]control,
	input [3:0]data_in,
	input si_left,
	input si_right,
	output [3:0]q );
reg [3:0]temp;	
always@(posedge clk)
	begin 
		if(rst)
			temp<=0;
				
		else begin
			case(control)
				2'b00: temp<=temp;
				2'b01: temp<={si_left,temp[3:1]};
				2'b10: temp<={temp[2:0],si_right};
				2'b11: temp<=data_in;
			endcase
		end
	end
assign q = temp;	
endmodule

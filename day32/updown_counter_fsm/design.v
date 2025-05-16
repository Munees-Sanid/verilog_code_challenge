module moore(
	input updown,clk,rst,
	output reg [2:0] count);
reg [1:0]ps,ns;
parameter idle = 2'b00;
parameter up_count = 2'b01;
parameter down_count = 2'b10;


always@(posedge clk)
	begin
	if(!rst)
		ps<=idle;
	else 
		ps<=ns;
	end

always@(updown,ps)begin
case(ps)
	idle: if(updown)
		ns=up_count;
		else 	
		ns=down_count;
		
	up_count: if(updown)
		ns=up_count;
		else 
		ns=down_count;
	down_count: if(updown)
		ns=up_count;
		else
		ns=down_count;

	endcase
	end
always@(posedge clk)begin
	if(!rst)
	count<=0;
	else begin
	case (ps)
	up_count: count<=count+1;
	down_count: count<=count-1;
	default :count<=count;
	endcase
	end
	end

endmodule

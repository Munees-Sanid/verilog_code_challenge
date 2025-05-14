// moore overlapping 10110
module moore(
	input in_seq,clk,rst,
	output reg out);
reg [2:0]ps,ns;
parameter idle = 3'b000;
parameter s1 = 3'b001;
parameter s10 = 3'b010;
parameter s101 = 3'b011;
parameter s1011 = 3'b100;
parameter s10110 = 3'b101;

always@(posedge clk)
	begin
	if(!rst)
		ps<=idle;
	else 
		ps<=ns;
	end

always@(in_seq,ps)begin
case(ps)
	idle: if(in_seq)begin
		ns=s1;
		out=0;
		end
		else begin
		ns=idle;
		out=0;
		end
		
	s1: if(in_seq)begin
		ns=s1;
		out=0;
		end
		else begin
		ns=s10;
		out=0;
		end
	s10: if(in_seq)begin
		ns=s101;
		out=0;
		end
		else begin
		ns=idle;
		out=0;
		end
	s101: if(in_seq)begin
		ns=s1011;
		out=0;
		end
		else begin
		ns=s1;
		out=0;
		end
	s1011: if(in_seq)begin
		ns=s1;
		out=0;
		end
		else begin
		ns=s10110;
		out=0;
		end
	s10110: if(in_seq)begin
		ns=s101;
		out=1;
		end
		else begin
		ns=idle;
		out=1;
		end
	endcase
	end
endmodule
		

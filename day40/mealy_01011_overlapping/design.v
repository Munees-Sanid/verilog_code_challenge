// mealy 01011 overlapping
module mealy(
	input in_seq,clk,rst,
	output reg out);

reg [2:0]ps,ns;

parameter idle=3'b000;
parameter s0=3'b001;
parameter s01=3'b010;
parameter s010=3'b011;
parameter s0101=3'b100;


always@(posedge clk)
	begin 
	if(!rst)
			ps<=idle;
		else 
			ps<=ns;
	end

always@(in_seq,ps)
begin 
case(ps)

idle :  if(in_seq)
		begin
		ns=idle;
		out=0;
		end
		
		else begin
		ns=s0;
		out=0;
		end
		
s0   :  if(in_seq)
		begin
		ns=s01;
		out=0;
		end
		
		else begin
		ns=s0;
		out=0;
		end

s01  :  if(in_seq)
		begin
		ns=idle;
		out=0;
		end
		
		else begin
		ns=s010;
		out=0;
		end

s010 :  if(in_seq)
		begin
		ns=s0101;
		out=0;
		end
		
		else begin
		ns=s0;
		out=0;
		end
		
s0101 :  if(in_seq)
		begin
		ns=idle;
		out=1;
		end
		
		else begin
		ns=s010;
		out=0;
		end	
endcase
end
endmodule


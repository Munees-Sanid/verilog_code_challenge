module mealy(
	input in_seq, clk, rst,
	output reg out);

reg [2:0] ps, ns;

parameter idle   = 3'b000;
parameter s1     = 3'b001;
parameter s11    = 3'b010;
parameter s110   = 3'b011;
parameter s1100  = 3'b100;

always@(posedge clk)
	begin 
	if(!rst)
			ps<=idle;
		else 
			ps<=ns;
	end

always@(in_seq, ps)
begin 
case(ps)

idle :  if(in_seq)
		begin
		ns=s1;
		out=0;
		end
		
		else begin
		ns=idle;
		out=0;
		end
		
s1 :  if(in_seq)
		begin
		ns=s11;
		out=0;
		end
		
		else begin
		ns=idle;
		out=0;
		end

s11 :  if(in_seq)
		begin
		ns=s11;
		out=0;
		end
		
		else begin
		ns=s110;
		out=0;
		end

s110 :  if(in_seq)
		begin
		ns=s1;
		out=0;
		end
		
		else begin
		ns=s1100;
		out=0;
		end
		
s1100 :  if(in_seq)
		begin
		ns=s1;
		out=1;
		end
		
		else begin
		ns=idle;
		out=0;
		end	
endcase
end
endmodule


// design code for 101 mealy overlapping

module mealy(
	input in_seq,clk,rst,
	output reg out);
// declaration of state variable
reg [1:0] ps,ns;
// state encoding
parameter idle=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;

// implement the state registor
always@(posedge clk)
begin 
	if(~rst)
		ps<=idle;
	else
		ps<=ns;
end
// always block for nsd and od

always @(in_seq,ps)begin
case(ps)
idle:if(in_seq)begin
	ns=s1;
	out=0;
	end
	else begin
	ns=idle;
	out=0;
	end
s1:if(in_seq)begin
	ns=s1;
	out=0;
	end
	else begin
	ns=s2;
	out=0;
	end
s2:if(in_seq)begin
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


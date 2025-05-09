module adder(
	input a,b,
	output reg s,c);
function [1:0]HA ( input x,y );
	begin
	HA = x+y;
	end
endfunction
always@(a,b)begin
 {c,s} = HA(a,b);
end
endmodule

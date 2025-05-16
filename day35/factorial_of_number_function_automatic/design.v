module factorial(input [31:0]N, output [63:0]facto);
assign facto=fact(N);
function automatic [63:0]fact(input [31:0]N);
begin
	if(N>=1)
		fact=fact(N-1)*N;
	else
		fact=1;
end
endfunction
endmodule


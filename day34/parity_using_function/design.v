module parity(
	input [7:0]din,
	output y);
function parity_func(input [7:0]din);
integer i;
reg temp;
begin 
temp=0;
for(i=0;i<=7;i=i+1)
	temp=temp^din[i];
parity_func =temp;
end
endfunction
assign y=parity_func(din);
endmodule


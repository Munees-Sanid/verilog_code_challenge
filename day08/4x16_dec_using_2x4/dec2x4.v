module dec( 
	input en,
	input [1:0]i,
	output [3:0]y);
assign y[3]=~i[1]&~i[0]&en;
assign y[2]=~i[1]&i[0]&en;
assign y[1]=i[1]&~i[0]&en;
assign y[0]=i[1]&i[0]&en;
endmodule


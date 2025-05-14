// 4x16 using 2x4 decoder

module decoder_2x4(
	input en,
	input [1:0]i,
	output [3:0]d );
	
assign d[0]= ~i[1]&~i[0]&en;
assign d[1]= ~i[1]&i[0]&en;
assign d[2]= i[1]&~i[0]&en;
assign d[3]= i[1]&i[0]&en;
endmodule

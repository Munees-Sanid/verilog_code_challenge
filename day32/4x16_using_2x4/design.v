// 4x16 using 2x4 decoder

`include"2x4_decoder.v"

module decoder(
	input [3:0]i,
	output [15:0]d);
	wire [3:0]w;
decoder_2x4 d1(w[0],i[1:0],d[3:0]);
decoder_2x4 d2(w[1],i[1:0],d[7:4]);
decoder_2x4 d3(w[2],i[1:0],d[11:8]);
decoder_2x4 d4(w[3],i[1:0],d[15:12]);
decoder_2x4 d5(1'b1,i[3:2],w);
endmodule

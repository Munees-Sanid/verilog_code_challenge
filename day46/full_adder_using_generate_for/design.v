module FA(
		input a,b,cin,
		output sum,carry);
		
assign {carry,sum} = a+b+cin;
endmodule

module adder( 
		input [3:0]a,b,
		input cin,
		output [3:0]sum,
		output cout
		);

wire [4:0] w;
assign w[0]=cin;
assign cout = w[4];

genvar i ;
	generate for(i=0;i<4;i=i+1)
		begin : ripple
		FA fa(a[i],b[i],w[i],sum[i],w[i+1]);
		end
	endgenerate 

endmodule

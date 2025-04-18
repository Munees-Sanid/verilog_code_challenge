module dec(
	input a,b,
	output [3:0]d);
wire w1,w2;
not n1 (w1,a);
not n2 (w2,b);
and a1 (d[0],w1,w2);
and a2 (d[1],w1,b);
and a3 (d[2],a,w2);
and a4 (d[3],a,b);
endmodule 


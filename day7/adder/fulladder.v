// full adder using half adder
module HA( 
	 input a,b,
	 output s,c);
assign s = a^b;
assign c=a&b;
endmodule 

 module FA(
 	input a,b,cin,
 	output s,cout);
wire w1,w2,w3;
 HA a1(a,b,w1,w2);
 HA a2(w1,cin,s,w3);
 assign cout=w3|w2;
 endmodule
 
 


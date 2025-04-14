module comparator(
	input [3:0]a,
	input [3:0]b,
	output a_gt_b,
	output a_eq_b,
	output a_ls_b);
wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
wire l1,l2,l3,l4,l5,l6,l7,l8;
// xnor operation 
xnor x1(w4,a[3],b[3]);
xnor x2(w5,a[2],b[2]);
xnor x3(w6,a[1],b[1]);
xnor x4(w7,a[0],b[0]);

// not operation of b
not n1 (w0,b[3]);
not n2 (w1,b[2]);
not n3 (w2,b[1]);
not n4 (w3,b[0]);

// not operation of a 
not n5 (l5,a[3]);
not n6 (l6,a[2]);
not n7 (l7,a[1]);
not n8 (l8,a[0]);
// a greater tha b
and a1(w8,a[3],w0);
and a2(w9,a[2],w1,w4);
and a3(w10,a[1],w2,w4,w5);
and a4(w11,a[0],w3,w4,w5,w6);
or o1(a_gt_b,w8,w9,w10,w11);

// a == b operation
and a5(a_eq_b,w4,w5,w6,w7);

// a lesser than b operation 
and a6(l1,b[3],l5);
and a7(l2,b[2],l6,w4);
and a8(l3,b[1],l7,w4,w5);
and a9(l4,b[0],l8,w4,w5,w6);
or o2(a_ls_b,l1,l2,l3,l4);
endmodule

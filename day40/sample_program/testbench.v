// difference between wire and reg in multi-driver condition 
module test;
reg a,b;
// reg y; // it leaves error condition, reg won't support the multidriver condition 
wire y; // wire support the multi-driver condition 
// wand y ; // if multi-driver condition exit, it make as "and" operation between two 
// wor y ; // if multi-driver condition exit, it make as "or" operation between two 
assign y= a|b;
assign y= a&b;

initial $display(y); // simulator get confusion and it gives the value as x if you declare wire y
endmodule

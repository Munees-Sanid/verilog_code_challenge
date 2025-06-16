module tb;
integer a=10,b=20;
initial b=a;
initial a=b;

initial $display(a,b);
endmodule

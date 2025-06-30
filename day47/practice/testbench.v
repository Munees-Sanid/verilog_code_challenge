
/*
// example
module wir;
    reg a, b;
    wire y;
  assign   y = a&b;
  
    initial begin
       a=0;
       b=1;
       
        #1
        $display("a = %b, b = %b, y = %b", a, b, y);
    end
    
endmodule


module test;
  reg a, b, c;

  always @(*) begin
    a = 0;
    b = 0;
    c <= 1;
   
    $display(a, b, c);
  end


endmodule


// what is exponent 
module test;
  reg a, b,c;
  real d;
  always @(a,b,c) begin
    a = 0;
    b = 0;
    c <= 1;
    $display("%0d %0d  %0d",a, b, c);
  end

  initial begin
    a = 1;
    #1;
    a = 0;
    #1;
    d=3.2e2;
  $display(" real is %0f ", d);
  end
endmodule



// wire, wand , wor difference
module tb;
wor a;
wire b=0,c=1;
assign a=b&c;
assign a=b|c;
initial #1 $display("%b",a);
endmodule

*/





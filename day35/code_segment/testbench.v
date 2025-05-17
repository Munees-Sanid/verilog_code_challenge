module tb;
reg [7:0] a = 8'b00111001;
reg b;
reg [7:0] c=8'b1111_1111;

initial begin
 $display("c = %b", c);
    b = ~|a;                          
    $display("b = %b", b);
    c = {a[5:3], {3 {b}} };              
    $display("c = %b", c);
end
endmodule


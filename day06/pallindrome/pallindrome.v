module pallindrome(
        input [2:0]a,
        output y);
assign y = (a[2]==a[0])?1:0;
endmodule

module tb;
reg [2:0]a;
wire y;
pallindrome dut (.*);
initial begin
a=3'b001 ; 
#5 a=3'b010 ;
#5 a=3'b011 ;
#5 a=3'b111 ;
#5 a=3'b101 ;
#5 $finish;
end
initial begin
$monitor ("Time %0t  a=%b   :: y=%b ",$time,a,y);
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

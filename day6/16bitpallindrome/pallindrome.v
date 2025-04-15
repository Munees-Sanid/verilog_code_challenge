module pallindrome(
        input [15:0]a,
        output [8*4:0]y);
assign y = ((a[0])==1'b0)?"even":"odd";
endmodule

module tb;
reg [15:0]a;
wire [8*4:0]y ;
pallindrome dut (.*);
initial begin
a=16'd3;
#5 a=16'd2;
#5 a=16'd7;
#5 $finish;
end
initial begin
$monitor ("Time %0t  a=%b   :: y=%s" ,$time,a,y);
end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

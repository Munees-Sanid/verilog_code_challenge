`include "parity.v"
module parity_tb;
reg a,b,c;
wire odd,even;
parity dut (.*);
initial begin
$monitor("Time = %0t  a= %b b=%b c= %b odd= %b even=%b ",$time, a,b,c,odd,even);
end
initial begin 
a= 0 ; b = 0 ; c=0 ;
 #10 a= 0 ; b = 0 ; c=0 ;
 #10 a= 0 ; b = 0 ; c=1 ;
 #10 a= 0 ; b = 1 ; c=0 ;
 #10 a= 0 ; b = 1 ; c=1 ;
 #10 a= 1 ; b = 0 ; c=0 ;
 #10 a= 1 ; b = 0 ; c=1 ;
 #10 a= 1 ; b = 1 ; c=0 ;
 #10 a= 1 ; b = 1 ; c=1 ;
 end
 
 initial begin
 $dumpfile ("dump.vcd");
 $dumpvars (0, parity_tb);
 end
 endmodule

module det_2(
input a,b,c,
output y0,y1);
assign y0= ~c;
assign y1= c;
endmodule

module det_2_tb;
reg a,b,c;
wire y0,y1;
det_2 dut (.*);
initial begin
$monitor("Time = %0t  a= %b b=%b c= %b y0 = %b y1 =%b  ",$time, a,b,c,y0,y1);
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
 $dumpfile ("det_2.vcd");
 $dumpvars (0, det_2_tb);
 end
 endmodule

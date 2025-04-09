module mux_2(
input i0,i1,s,
output y);
assign y= (~s&i0)|(s&i1);
endmodule

module mux_2_tb;
reg i0,i1,s;
wire y;
mux_2 dut (.*);
initial begin
$monitor("Time = %0t  i0= %b i1=%b s= %b y = %b ",$time, i0,i1,s,y);
end
initial begin 
i0= 0 ; i1 = 0 ; s=0 ;
 #10 i0= 0 ; i1 = 0 ; s=0 ;
 #10 i0= 0 ; i1 = 0 ; s=1 ;
 #10 i0= 0 ; i1 = 1 ; s=0 ;
 #10 i0= 0 ; i1 = 1 ; s=1 ;
 #10 i0= 1 ; i1 = 0 ; s=0 ;
 #10 i0= 1 ; i1 = 0 ; s=1 ;
 #10 i0= 1 ; i1 = 1 ; s=0 ;
 #10 i0= 1 ; i1 = 1 ; s=1 ;
 end
 
 initial begin
 $dumpfile ("mux_2");
 $dumpvars (0, mux_2_tb);
 end
 endmodule

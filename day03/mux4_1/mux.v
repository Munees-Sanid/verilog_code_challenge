module mux_2(
	input [3:0]i,
	input [1:0]s,
	output y);
assign y1= (i[0]&~s[1]&~s[0]);
assign y2= (i[1]&~s[1]&s[0]);
assign y3= (i[2]&~s[1]&s[0]);
assign y4= (i[3]&s[1]&s[0]);
assign y= y1|y2|y3|y4;
endmodule
 

module test;

reg [3:0]i;
reg [1:0]s;
wire y;

mux_2 dut (.*);

initial begin
$monitor("Time = %0t  i=%b  s=%b y= %b",$time, i,s,y);

i[3]= 0; i[2]=1 ; i[1]=0;  i[0]=0 ;s=2'b01;
#10 i[3]= 1; i[2]=0 ; i[1]=0;  i[0]=0 ;s=2'b11;
#10 i[3]= 0; i[2]=0 ; i[1]=0;  i[0]=1; s=2'b00;
#10 $finish;
end
 initial begin
 $dumpfile ("dump.vcd");
 $dumpvars (0, test);
 end
 endmodule
 

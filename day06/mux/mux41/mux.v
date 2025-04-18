// Data flow statement
module mux(
	 input [3:0]i,
	 input [1:0]s,
	 output y);
assign y =  (s[1])? (  (s[0])? i[3]:i[2] ): ( (s[0])?i[1]:i[0] );
endmodule
	 
module tb;
reg [3:0]i;
reg [1:0]s;
wire y;
mux dut (.*);
initial begin 
i=4'b0001  ;s=2'b00;
#5 i=4'b0100 ; s=2'b10;
#5 i=4'b1000 ; s=2'b11;
#5 i=4'b0010 ; s=2'b01;
#5 $finish;
end

initial begin
$monitor("Time = %0t   i = %b s=%b  :: y =%b " , $time , i,s,y);
end
initial  begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

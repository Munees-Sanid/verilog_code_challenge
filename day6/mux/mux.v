// Data flow statement
module mux(
	 input [1:0]i,
	 input s,
	 output y);
assign y= (s)?i[1]:i[0];
endmodule
	 
module tb;
reg [1:0]i;
reg s;
wire y;
mux dut (.*);
initial begin 
i=2'b10  ;s=0;
#5 i=2'b01 ; s=0;
#5 i=2'b01 ; s=1;
#5 i=2'b10 ; s=1;
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

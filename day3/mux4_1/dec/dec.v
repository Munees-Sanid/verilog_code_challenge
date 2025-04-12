module  dec(
	input [1:0]i,
	output [3:0]y);
assign y[3]= ~i[1] & ~ i[0];
assign y[2]= ~i[1] &  i[0];
assign y[1]= i[1] &  ~i[0];
assign y[0]= i[1] &  i[0];
endmodule 


module test;
reg [1:0]i;
wire [3:0]y;
dec dut(.*);
initial begin 
$monitor ("Time = %0t i=%b y=%b ", $time , i,y);
end
initial begin 
i=2'b00;
#10 i=2'b01;
#10 i=2'b10;
#10 i=2'b11;
#10 $finish;
end
initial begin
 $dumpfile ("dump.vcd");
 $dumpvars (0, test);
 end
 endmodule

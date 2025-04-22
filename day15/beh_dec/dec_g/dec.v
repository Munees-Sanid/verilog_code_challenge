// 2x4 using case statament 

module dec(
	input [1:0]i,
	output reg [3:0]y);
always@(i)begin
case(i) 
	2'b00 : y=4'b0001;
	2'b01 : y=4'b0010;
	2'b10 : y=4'b0100;
	2'b11 : y=4'b1000;
	default : y=4'bzzzz;
	
endcase
end
endmodule

// test bench
 module tb;
  reg [1:0]i;
  wire [3:0]y;
  dec dut(i,y);
 initial begin 
 $monitor (" i= %b  ::  y=%b", i,y);
 for(integer j=0; j<2**2;j=j+1)begin
 i=j; #5; end
 end 
 endmodule

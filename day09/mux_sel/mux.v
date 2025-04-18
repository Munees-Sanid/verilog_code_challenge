// mux in different approach 
module mux #(parameter n=32)(
	input [n-1:0]i,
	input [$clog2(n)-1:0]s,
	output y);
assign y=i[s];
endmodule

// testbench

module tb;
parameter n=32;  // value can be changed
reg [n-1:0]i;
reg [$clog2(n)-1:0]s;
wire y;
mux #(n) dut(i,s,y);
initial begin 
$monitor("i = %b  s = %b  ::  y=%b",i,s,y);
for(integer j=0 ; j<n;j=j+1)begin
i=1<<j;
s=j; #5; end
end

initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

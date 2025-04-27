// design code for d flip flop

module dff(
	input d,clk,
	output reg q);
always@(posedge clk)begin
case(d)
	1'b0 : q <=0;
	1'b1 : q <=d;
	
endcase
end
endmodule


// test bench

module tb;
reg d,clk;
wire q;
dff dut(d,clk,q);
always #5 clk=~clk;
initial begin
clk=0;
d=0 ; 
#5 d=1 ;
#10 $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


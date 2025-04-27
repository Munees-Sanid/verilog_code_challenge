// design code for t flip flop

module tff(
	input t,clk,
	output reg q);
always@(posedge clk)begin
case(t)
	1'b0 : q <=q;
	1'b1 : q <=~q;
	
endcase
end
endmodule


// test bench

module tb;
reg t,clk;
wire q;
tff dut(t,clk,q);
always #5 clk=~clk;
initial begin
clk=0;
t=0 ; 
#5 t=1 ;
#10 $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


// design code for sr flip flop

module srff(
	input s,r,clk,
	output reg q);
always@(posedge clk)begin
case({s,r})
	2'b00 : q <=q;
	2'b01 : q <=0;
	2'b10 : q <=1;
	2'b11 : q <=1'bx;
endcase
end
endmodule


// test bench

module tb;
reg s,r,clk;
wire q;
srff dut(s,r,clk,q);
always #5 clk=~clk;
initial begin
clk=0;
s=0 ; r =0;
#5 s=0 ; r =1;
#5 s=1 ; r =0;
#5 s=1 ; r =1;
#10 $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


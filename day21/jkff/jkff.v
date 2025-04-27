// design code for jk flip flop

module jkff(
	input j,k,clk,
	output reg q);
always@(posedge clk)begin
case({j,k})
	2'b00 : q <=q;
	2'b01 : q <=0;
	2'b10 : q <=1;
	2'b11 : q <=~q;
endcase
end
endmodule


// test bench

module tb;
reg j,k,clk;
wire q;
jkff dut(j,k,clk,q);
always #5 clk=~clk;
initial begin
clk=0;
j=0 ; k =0;
#5 j=0 ; k =1;
#5 j=1 ; k =0;
#5 j=1 ; k =1;
#10 $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


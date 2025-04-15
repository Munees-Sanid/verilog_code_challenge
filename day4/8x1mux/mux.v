module mux(
	input i0,i1,s,
	output y);
assign y = s?i1:i0;
endmodule


module mux8_1(
    input  [7:0] i,   
    input  [2:0] sel,    
    output y);
wire [3:0] w1;
wire [1:0] w2;
// level 1
mux m0(i[0], i[1], sel[0], w1[0]);
mux m1(i[2], i[3], sel[0], w1[1]);
mux m2(i[4], i[5], sel[0], w1[2]);
mux m3(i[6], i[7], sel[0], w1[3]);
//level 2
mux m4(w1[0], w1[1], sel[1], w2[0]);
mux m5(w1[2], w1[3], sel[1], w2[1]);
// level 3
mux m6(w2[0], w2[1], sel[2], y);
endmodule


// Testbench

module tb;
reg [7:0] i;
reg [2:0] sel;
wire y;
integer j;
mux8_1 dut(.*);
initial begin
i = 8'b10101010;
for(j = 0; j < 8; j = j + 1)
#5 sel = j;
end
initial $monitor("sel = %0d -> y = %b", sel, y);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb);
end
endmodule


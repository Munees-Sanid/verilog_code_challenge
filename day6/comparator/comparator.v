module comp( 
	input [1:0]a,b,
	output a_gt_b,a_eq_b,a_ls_b);
assign a_gt_b = (a>b)? 1:0;
assign a_eq_b = (a==b)? 1:0;
assign a_ls_b = (a<b)? 1:0;
endmodule

module tb;
reg [1:0]a,b;
wire a_gt_b,a_eq_b,a_ls_b;
comp dut (.*);
initial begin
a=2'b00 ; b = 2'b00;
#5 a=2'b01 ; b = 2'b01;
#5 a=2'b11 ; b = 2'b10;
#5 a=2'b11 ; b = 2'b01;
#5 a=2'b10 ; b = 2'b11;
#5 $finish;
end
initial begin
$monitor ("Time %0t  a=%b  b = %b  :: a_gt_b =%b   a_eq_b =%b   a_ls_b =%b ",$time,a,b,a_gt_b,a_eq_b,a_ls_b );
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule

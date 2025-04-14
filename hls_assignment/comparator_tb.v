`include "comparator.v"

module comparater_tb;
reg [3:0] a, b;
wire a_gt_b, a_eq_b, a_ls_b;

comparator dut (.*); // It automatically port the connection 

// To display the value
initial begin
$monitor("Time = %0t  a = %b  b = %b   ::   a_gt_b = %b a_eq_b = %b  a_ls_b = %b",$time, a, b, a_gt_b, a_eq_b, a_ls_b);
end
// few combination of 4 bit a and b 
initial begin
 a = 4'b0000; b = 4'b0000;
 #10 a = 4'b0001; b = 4'b0000;
 #10 a = 4'b0010; b = 4'b0011;
 #10 a = 4'b0101; b = 4'b0101;
 #10 a = 4'b0111; b = 4'b0110;
 #10 a = 4'b1000; b = 4'b1000;
 #10 a = 4'b1100; b = 4'b1101;
 #10 a = 4'b1111; b = 4'b0001;
 #10 a = 4'b0000; b = 4'b1111;
end

initial begin
 $dumpfile("comparater_tb.vcd");
 $dumpvars(0, comparater_tb);
end
endmodule


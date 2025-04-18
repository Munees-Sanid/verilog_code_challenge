module xor_tb;
reg a,b;
wire y;
xor_g dut (.*);
initial begin
a=0;b=0;
#5 a=0;b=1;
#5 a=1;b=0;
#5 a=1;b=1;
#10 $finish;
end
initial begin 
$monitor (" Time = %0t a=%b b=%b y=%b ",$time , a,b,y);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0, xor_tb);
end
endmodule

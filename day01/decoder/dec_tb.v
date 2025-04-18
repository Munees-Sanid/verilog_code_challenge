module dec_2_4;
reg a,b;
wire [3:0]d;
dec dut (.*);
initial begin
a=0; b=0;
#5 a=0; b=1;
#5 a=1; b=0;
#5 a=1; b=1;
#20 $finish;
end
initial begin 
$monitor("Time = %0t a =%b b = %b  : d0= %b d1= %b d2= %b d3= %b" ,$time, a,b,d[0], d[1],d[2],d[3] );
end
initial begin 
$dumpfile ("dump.vcd");
$dumpvars(0,dec_2_4);
end
endmodule

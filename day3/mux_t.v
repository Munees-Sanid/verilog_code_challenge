module mux2(
	input i0,i1,s,
	output y);
bufif0 (y,i0,s);
bufif1 (y,ii,s);
endmodule


module mux2_tb;

reg i0,i1,s;
wire y;

mux2 dut (.*);

initial begin 
i0=0; i1=0 ; s=0;
#10 i0=0; i1=0 ; s=1;
#10 i0=0; i1=1 ; s=0;
#10 i0=0; i1=1 ; s=1;
#10 i0=1; i1=0 ; s=0;
#10 i0=1; i1=0 ; s=1;
#10 i0=1; i1=1 ; s=1;
#10 i0=1; i1=1 ; s=1;
#10 $finish;
end

initial begin
 $monitor( "TIme =%0t  i0= %b  i1 = %b  s = %b : y = %b " ,$time,i0,i1,s,y);
 end
 initial begin
 $dumpfile ( "dump.vcd");
 $dumpvars(0, mux2_tb);
 end
 endmodule
 

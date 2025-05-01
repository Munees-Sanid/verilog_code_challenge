// test bench
`include"design.v"
module tb;
reg rst,clk,load;
reg [3:0]parallel_in;
wire s_out;
integer file;
piso dut(rst,clk,load,parallel_in,s_out);
always #5 clk=~clk;
initial begin
file = $fopen("output_data.txt", "w");

clk=0;
rst=1;
// reset after 10s
#10 rst=0;

//  data value
#5 load=1; parallel_in=4'b1010;
#5 load=0;
#50 $fclose(file);
 $finish;
end
always@(posedge clk)begin
$fdisplay(file,"sim= %0t rst =%b load=%b :: parrarel in =%d :: shift register =%b :: serial out =%b",$time,rst,load,parallel_in,dut.shift_register,s_out);
end
initial begin 
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


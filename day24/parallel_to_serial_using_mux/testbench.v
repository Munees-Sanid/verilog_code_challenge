// test bench
`include"design.v"
module tb;
reg clk;
reg [3:0]parallel_in;
wire serial_out;

integer file;
reg [3:0]serial_data;

mux_p dut(clk,parallel_in,serial_out);

always #5 clk=~clk;

initial begin
$monitor("time =%0t parallel in = %b ::  serial out =%b     count=%d",$time,parallel_in,serial_out,dut.count);
clk=0;
parallel_in = 4'b1010;
serial_data=4'b0;

#10 serial_data[0]=serial_out;
#10 serial_data[1]=serial_out;
#10 serial_data[2]=serial_out;
#10 serial_data[3]=serial_out;

file = $fopen("output.bin", "wb");

$fwrite(file, "%b", serial_data);

$fclose(file);

$finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end

endmodule

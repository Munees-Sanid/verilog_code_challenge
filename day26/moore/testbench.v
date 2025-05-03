
`include"design.v"
module tb;

    reg clk;
    reg rst;
    reg in;
    wire out;

    moore_1011_detector uut (clk,rst,in,out
    );

   
    always #5 clk = ~clk;

   
    initial begin
  $monitor("time = %0t rst=%b ::   in =%b   ::  out =%b",$time,rst,in,out);     
        clk = 0;
        rst = 1;
        in = 0;

        #10 rst = 0;

       
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;


        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;

      
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        in = 0; #10;

        $finish;
    end
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


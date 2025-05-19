`include"design.v"
module tb_priority_encoder;
  reg [7:0] d;
  wire [2:0] y;

  priority_encoder uut (d,y);
initial $monitor("sim = %0t d = %b :: y = %b",$time,d,y);
  initial begin
    d = 8'b00000000; #10;
    d = 8'b00000001; #10;
    d = 8'b00000010; #10;
    d = 8'b00000100; #10;
    d = 8'b00001000; #10;
    d = 8'b00010000; #10;
    d = 8'b00100000; #10;
    d = 8'b01000000; #10;
    d = 8'b10000000; #10;
    d = 8'b11000000; #10;
    d = 8'b10100000; #10;
    d = 8'b00000000; #10;
    $finish;
  end
endmodule


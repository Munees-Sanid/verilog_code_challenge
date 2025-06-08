`include"design.v"
module tb;

reg clk;
reg rst;
reg enable;
reg [6:0] slave_address;
reg rw;
reg [7:0] data_in;
wire sda;
wire scl;
wire done;
wire [2:0] state;

i2c_master uut (
 .clk(clk),
 .rst(rst),
 .enable(enable),
 .slave_address(slave_address),
 .rw(rw),
 .data_in(data_in),
 .sda(sda),
 .scl(scl),
 .done(done),
 .state(state)
);

always #5 clk = ~clk;

initial begin
 clk = 0;
 rst = 1;
 enable = 0;
 slave_address = 7'b1010001;
 rw = 0;
 data_in = 8'hAB;
 #20 rst = 0;
 #10 enable = 1;
 #20 enable = 0;
 #500 $finish;
end

initial begin
 $monitor("Time=%4t | SDA=%2b SCL=%2b DONE=%2b STATE=%2d", $time, sda, scl, done, state);
end
initial begin 

$dumpfile("dump.vcd");
$dumpvars(0,tb);
end

endmodule


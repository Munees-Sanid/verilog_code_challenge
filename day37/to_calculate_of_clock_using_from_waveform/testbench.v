module clock(output reg clk);

always #6 clk=~clk;
initial begin
clk=0;
#200 $finish;
end
endmodule

module tb;

wire clk;
clock d1(clk);

time a,b,tp;
always@(posedge clk)
a=$time;
always@(posedge clk)begin
b=$time;
tp=b-a;
$display("time period is %0t",tp);
end
endmodule



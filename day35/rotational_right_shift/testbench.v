// rotational right shift
module tb;
reg [3:0] k= 4'b0101;
always begin
#2;
k={k[0],k[3:1]};
end
initial begin
$monitor("%b",k);
#20 $finish(2);
end
endmodule

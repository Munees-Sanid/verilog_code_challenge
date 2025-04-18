module pallindrome(
input [3:0]c,
input [1:0]s,
output y);
assign y=(~s[1]&~s[0]&(~c[0]&~c[3]|c[0]&c[3]))|(~s[1]&s[0]&(~c[1]&~c[2]|c[1]&c[2]))|(s[1]&~s[0]&(~c[2]&~c[1]|c[2]&c[1]))|(s[1]&s[0]&(~c[3]&~c[0]|c[3]&c[0]));
endmodule

module tb;
reg [3:0]c;
reg [1:0]s;
wire y;
pallindrome dut(c,s,y);
initial begin
$monitor("c=%b s=%b y=%b",c,s,y);
for(integer i=0;i<64;i=i+1)begin
{s,c}=i; #5;
end
end
endmodule


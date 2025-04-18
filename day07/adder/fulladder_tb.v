`include "fulladder.v"
module tb1;
reg a,b,cin;
wire s,cout;
FA dut(a,b,cin,s,cout);
initial begin
a=0; b=0; cin=0;
#5 a=0; b=1; cin=0;
#5 a=1; b=1; cin=0;
end
initial begin 
$monitor("a=%b b =%b cin=%b s=%b cout=%b",a,b,cin,s,cout);
end
endmodule

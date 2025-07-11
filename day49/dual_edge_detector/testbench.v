module tb; 
reg clk=0;
integer pos=0,neg=0;

always #5 clk=~clk;

always@(posedge clk or negedge clk)begin
if(clk==1)
pos=pos+1;
else
neg=neg+1;
end


initial begin
#50;
 
 $display("posedge count  =  %0d   ::  negedge count  =  %0d",pos,neg);
 
 end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
#50 $finish;
end
endmodule

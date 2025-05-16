module clk_gen(input rst,output clk);
reg int_clk=0;
assign clk=int_clk;
task cg();
begin
int_clk=~clk;
#2;
end
endtask
always 
begin
 cg();
 #3;
 end
initial begin
#100 $finish;
end
endmodule


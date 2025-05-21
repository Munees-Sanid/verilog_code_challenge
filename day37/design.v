module tb;
reg[2:0]a;
    initial begin 
    for(a=0;a<8;a=a+1)
    $display("a=%d",a);
    end
    endmodule

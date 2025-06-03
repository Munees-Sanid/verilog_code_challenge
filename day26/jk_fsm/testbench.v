`include"design.v"
module jkff_fsm_tb;

    
    reg clk;          
    reg j;            
    reg k;            
    reg rst;         
    wire q;           

   
    jkff_fsm uut (
        .clk(clk),
        .j(j),
        .k(k),
        .rst(rst),
        .q(q)
    );

  
    always begin
        #10 clk = ~clk; 
    end

  
    initial begin
      
        clk = 0;
        rst = 0;
        j = 0;
        k = 0;

       
        rst = 1;
        #20;            
        rst = 0;        
        
       
        j = 0; k = 0;
        #20;             

        
        j = 1; k = 0;
        #20;             

     
        j = 0; k = 1;
        #20;             

       
        j = 1; k = 1;
        #20;           

       
        rst = 1;
        #20;             
        rst = 0;         
    
        $stop;
    end

endmodule

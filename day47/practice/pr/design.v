// Code your design here
module fifo #(parameter depth = 8)(input clk,
                                   rst,
                                   wen,
                                   ren,
                                   input [depth -1 :0] wdata,
                                   output reg [depth -1 :0] rdata,
                                   output reg full,
                                   output reg empty,
                                   output reg p_full,
                                   output reg p_empty,
                                   output reg half_full,
                                   output reg overflow,
                                   output reg underflow);
  
  reg FULL,EMPTY,P_FULL,P_EMPTY,HALF_FULL,OVERFLOW, UNDERFLOW;
  reg[($clog2(depth)) : 0] wptr,rptr;
  reg [depth-1 : 0] mem [depth - 1:0];
  
  
  always @(posedge clk or negedge rst) 
   
    begin
      
      FULL = {~wptr[$clog2(depth)], wptr[($clog2(depth)-1):0]} == {rptr[$clog2(depth)], rptr[($clog2(depth)-1):0]};
      
      EMPTY =( (wptr ==rptr) );
      
      P_FULL = (wptr == (depth - 3));//replication operator
      
      P_EMPTY = (rptr == 3);

       
      HALF_FULL =(wptr == (depth)/2); 
                  
      OVERFLOW = (wen && FULL);
      
      UNDERFLOW = (ren && EMPTY);
      
      
                  
      if(!rst) 
        begin
          rdata <=0;
          rptr <=0;
          wptr <=0;
          p_full<=0;
          p_empty <= 0;
          half_full <= 0;
          underflow <=0;
          overflow <= 0;
          full<=0;
          empty <=1;
        end
      else 
            if(wen && !full)
        begin
          // writing into fifo
         
            begin
            
            mem[wptr[($clog2(depth)-1):0]] <= wdata;
            wptr <= wptr + 1;
              empty <= 0;
            
          end
        end
      else
        begin
          
          //reading the fifo 
          if(ren && !empty) 
            begin
              rdata <= mem[rptr[($clog2(depth) - 1):0]];
              rptr <= rptr + 1;
            end
          
          
          // CONDITIONS WHILE WRITING FIFO
          begin
            if(FULL) begin
              full<= 1;
            end
          else
            begin
            full<=0;
            end
          end
          
          
          
          begin
            if(P_FULL) begin
              p_full <= 1;
            end
            else
              begin
                p_full <= 0;
              end
          end
            
          // conditions while writing fifo
          begin 
          if(P_EMPTY) begin
            p_empty <= 1;
          end
            else
              begin
              p_empty <= 0;
              end
          end
          
          begin
            
          if(EMPTY) 
            begin
             empty <= 1;
            end
            
            else
              begin
                empty <=0;
              end
          end
          
          
          
          
          // condition for half full
          begin
          if(HALF_FULL)
            begin
            
              half_full <=1;
         
            end
            else
              begin
                
              half_full <= 0;
          
              end
          end
          
          
          //overflow
          
          begin
            
          if(OVERFLOW) begin
            overflow <= 1;
          end
            else
              begin
                overflow <=0;
              end
          end
          
          //underflow
          begin
            
          if(UNDERFLOW) begin 
            underflow <= 1;
          end
            else
              begin
                underflow <= 0;
              end
          end
              
              
        
        end
    end
      
endmodule 

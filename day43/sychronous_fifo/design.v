
// design code synchronous fifo
module fifo #(parameter depth=16)(
    input clk,rst,wr_en,rd_en, 
    input [7:0]d_in, 
    output full,empty, 
    output reg [7:0]d_out);
parameter pointer_width=$clog2(depth); // plus one is for full logic
reg[pointer_width:0] wr_ptr,rd_ptr;
reg[7:0] mem[depth-1:0];


always@(posedge clk)
begin 
    if(!rst)
    begin 
        wr_ptr<=0; rd_ptr<=0; d_out<=0;

    end
end

//Writing into fifo
always@(posedge clk)
begin 
    if(wr_en&&!full)
    begin 
        mem[wr_ptr[pointer_width-1:0]]<=d_in;
        wr_ptr<=wr_ptr+1;
    end
end

//Reading from fifo
always@(posedge clk)
begin 
    if(!rst) d_out<=0;
    else if(rd_en&&!empty)
    begin 
        d_out<=mem[rd_ptr[pointer_width-1:0]];
        rd_ptr<=rd_ptr+1;
    end
end

// full and empty
assign empty = (wr_ptr == rd_ptr);
assign full = ({~wr_ptr[pointer_width],wr_ptr[pointer_width-1:0]} == rd_ptr);
endmodule 


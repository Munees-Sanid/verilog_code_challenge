
// design code synchronous fifo
module fifo #(parameter depth=16)(
    input clk,rst,we,re, 
    input [7:0]d_in, 
    output full,empty, 
    output reg [7:0]d_out);
parameter pointer_width=$clog2(depth); // plus one is for full logic
reg[pointer_width:0] wptr,rptr;
reg[7:0] mem[depth-1:0];

// re = read enable
// we = write enable
// wptr = write pointer
// rptr = read pointer

always@(posedge clk)
begin 
    if(!rst)
    begin 
        wptr<=0; rptr<=0; d_out<=0;

    end
end

//Writing into fifo
always@(posedge clk)
begin 
    if(we&&!full)
    begin 
        mem[wptr[pointer_width-1:0]]<=d_in;
        wptr<=wptr+1;
    end
end

//Reading from fifo
always@(posedge clk)
begin 
    if(!rst) d_out<=0;
    else if(re&&!empty)
    begin 
        d_out<=mem[rptr[pointer_width-1:0]];
        rptr<=rptr+1;
    end
end

// full and empty
assign empty = (wptr == rptr);
assign full = ({~wptr[pointer_width],wptr[pointer_width-1:0]} == rptr);
endmodule 


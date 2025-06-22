// design code for synchronous fifo
module fifo (
    input clk, rst, wr_en, rd_en,
    input [7:0] d_in,
    output full, empty,
    output reg [7:0] d_out
);

reg [4:0] wr_ptr, rd_ptr;
reg [7:0] mem [15:0];

always @(posedge clk) begin
    if (!rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        d_out <= 0;
    end else if (wr_en && !full) begin
        mem[wr_ptr[3:0]] <= d_in;
        wr_ptr <= wr_ptr + 1;
    end
end

always @(posedge clk) begin
    if (!rst) begin
        d_out <= 0;
    end else if (rd_en && !empty) begin
        d_out <= mem[rd_ptr[3:0]];
        rd_ptr <= rd_ptr + 1;
    end
end

assign empty = (wr_ptr == rd_ptr);
assign full = ({~wr_ptr[4], wr_ptr[3:0]} == rd_ptr);

endmodule




// testbench

module tb;

reg clk, rst, wr_en, rd_en;
reg [7:0] d_in;
wire [7:0] d_out;
wire full, empty;

fifo dut (.*);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// task for writing memory using $random
task push;
    begin
        @(posedge clk);
        if (!full) begin
            d_in = $random;
            wr_en = 1;
        end else begin
            wr_en = 0;
        end
    end
endtask

// task for reading memory using 
task pop;
    begin
        @(posedge clk);
        if (!empty) begin
            rd_en = 1;
        end else begin
            rd_en = 0;
        end
    end
endtask

initial begin
    rst = 0;
    wr_en = 0;
    rd_en = 0;
    d_in = 0;
    #10 rst = 1;

    fork
        begin
            repeat (30) push();
            
            wr_en = 0;
        end
        begin
            #15;
            repeat (10) pop();
            rd_en = 0;
        end
    join

    #20 $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
end
endmodule


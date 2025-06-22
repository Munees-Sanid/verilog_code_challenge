module instruction_memory(input [3:0] pc, output reg [7:0] instruction);
reg [7:0] mem[0:15];
initial begin
    mem[0] = 8'b00010001;
    mem[1] = 8'b00010010;
    mem[2] = 8'b00010100;
    mem[3] = 8'b00011001;
    mem[4] = 8'b00000000;
end
always @(*) begin
    instruction = mem[pc];
end
endmodule


module register_file(
    input clk,
    input write_enable,
    input [1:0] read_reg1, read_reg2, write_reg,
    input [7:0] write_data,
    output reg [7:0] read_data1, read_data2
);
reg [7:0] regs[0:3];
always @(posedge clk) begin
    if (write_enable)
        regs[write_reg] <= write_data;
end
always @(*) begin
    read_data1 = regs[read_reg1];
    read_data2 = regs[read_reg2];
end
endmodule


module alu(
    input [7:0] a, b,
    input [3:0] opcode,
    output reg [7:0] result
);
always @(*) begin
    case(opcode)
        4'b0001: result = a + b;
        4'b0010: result = a - b;
        default: result = 8'b0;
    endcase
end
endmodule


module pipeline_top(input clk, input rst);
reg [3:0] pc;
wire [7:0] instr;
reg [7:0] IF_ID, ID_EX_A, ID_EX_B;
reg [3:0] ID_EX_opcode;
reg [1:0] ID_EX_dest;
reg [7:0] EX_MEM_result;
reg [1:0] EX_MEM_dest;
reg MEM_WB_write_en;
reg [7:0] MEM_WB_data;
reg [1:0] MEM_WB_dest;
wire [7:0] reg_data1, reg_data2;
wire [7:0] alu_result;

instruction_memory imem(pc, instr);
register_file rf(
    .clk(clk),
    .write_enable(MEM_WB_write_en),
    .read_reg1(IF_ID[3:2]),
    .read_reg2(IF_ID[1:0]),
    .write_reg(MEM_WB_dest),
    .write_data(MEM_WB_data),
    .read_data1(reg_data1),
    .read_data2(reg_data2)
);
alu my_alu(
    .a(ID_EX_A),
    .b(ID_EX_B),
    .opcode(ID_EX_opcode),
    .result(alu_result)
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        pc <= 0;
        IF_ID <= 0;
        ID_EX_A <= 0;
        ID_EX_B <= 0;
        ID_EX_opcode <= 0;
        ID_EX_dest <= 0;
        EX_MEM_result <= 0;
        EX_MEM_dest <= 0;
        MEM_WB_data <= 0;
        MEM_WB_dest <= 0;
        MEM_WB_write_en <= 0;
    end else begin
        pc <= pc + 1;
        IF_ID <= instr;
        ID_EX_opcode <= IF_ID[7:4];
        ID_EX_A <= reg_data1;
        ID_EX_B <= reg_data2;
        ID_EX_dest <= IF_ID[1:0];
        EX_MEM_result <= alu_result;
        EX_MEM_dest <= ID_EX_dest;
        MEM_WB_data <= EX_MEM_result;
        MEM_WB_dest <= EX_MEM_dest;
        MEM_WB_write_en <= 1;
    end
end
endmodule


`timescale 1ns / 1ps

module tb;

reg clk;
reg rst;

pipeline_top uut (
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    #150;
    $finish;
end

endmodule







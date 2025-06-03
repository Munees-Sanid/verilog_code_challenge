module Full_subtractor_bhv(a, b, bin, diff, bout);
input a, b, bin;
output reg diff, bout;

always @(a or b or bin) begin
    if (a - b - bin == 0) begin
        diff = 0;
        bout = 0;
    end
    else if (a - b - bin == 1) begin
        diff = 1;
        bout = 0;
    end
    else if (a - b - bin == -1) begin
        diff = 1;
        bout = 1;
    end
    else if (a - b - bin == -2) begin
        diff = 0;
        bout = 1;
    end
end

endmodule

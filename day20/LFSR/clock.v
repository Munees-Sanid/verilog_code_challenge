`timescale 1ns/1ps
module clock(output reg clk);
    real freq = 500; // 500 MHZ , average clock speed of fpga 
    real time_period, ton; 
    real duty = 50; 

    initial begin
        clk = 0;
        time_period = (1000 / freq);
        ton = (time_period * duty) / 100;
        #512 $finish; // 2^8 =256 , controlling lfsr over clock
    end

    always begin
        # (time_period - ton) clk = 1;
        # ton clk = 0;
    end
endmodule


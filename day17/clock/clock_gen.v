/////-----------------------Generate the Clock for speficif Frequency in MhZ------
`timescale 1ns/1ps
	module test;
		reg clk;
		real freq= 1; // (in MHZ) 
		real time_period, ton; // (In Ns)
		real duty = 50; // in percentage

			initial begin
				clk= 0;
				time_period= (1/freq);
				ton= (time_period*duty)/100;
			 #100 $finish;
			end

			always begin
			# (time_period-ton) clk= 1;
			#ton clk= 0;
			end

		initial begin
			$dumpfile("dump.vcd");
			$dumpvars(0,clk);
		end

			endmodule

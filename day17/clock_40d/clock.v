/////-----------------------Generate the Clock for speficif Frequency in MhZ------

	module test;
		reg clk; 
		real time_period, ton; // (In Ns)
		real duty = 40; // in percentage

			initial begin
				clk= 0;
				time_period= 20;
				ton= (time_period*duty)/100;
			 #1000 $finish;
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

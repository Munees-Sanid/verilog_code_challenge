`include "design.v"
// testbench

module tb;

reg clk = 0, rst = 0, we = 0, re = 0;
reg [7:0] d_in;
wire [7:0] d_out;
wire full, empty;
parameter write_count = 17;
parameter read_count = 18;

fifo  dut(.*);

always #5 clk = ~clk;

initial begin
      
    #12 rst = 1;
    

    repeat (write_count) begin
    	@(posedge clk);
    	#1
        if(!full)
        begin
		    we = 1; 
		    re = 0; 
		    d_in = $random;
		    $display("%0d : Data_in = %0d",dut.wptr,d_in);
        end
        else begin
        
        $display("full");
        we = 0;
        end
    end

  #2

   repeat (read_count) 
   
        begin
        #1
        @(posedge clk);
    	if(!empty)
    	begin
        re = 1;
        $display("%0d : Data_out = %0d",dut.rptr,d_out);
        end
        else begin
        	
         	$display("empty");
         	re=0;
         end
    end

    $finish;
end

initial begin
$dumpfile("dump.vcd");
$dumpvars;
end

endmodule


/*module tb;
integer num,i;
initial begin
num=13;
i=2;
loop: while(i <= num-1)begin : loop
	if((num % i)==0)begin
		$display("it is not prime");
	disable loop;
	end
	i=i+1;
	end
	
	if(i == num) $display("Prime number");
	end
endmodule
*/

module tb;
  integer num, i;
  integer is_prime;

  initial begin
    num = 13;
    is_prime = 1;

    for (i = 2; i <= num /2; i = i + 1) begin
      if ((num % i) == 0) begin
        is_prime = 0;
      end
    end


    if (is_prime == 1)
      $display("Prime number");
    else
      $display("It is not prime");
  end
endmodule


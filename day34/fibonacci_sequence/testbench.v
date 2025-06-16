/*module fibonacci #(parameter n=20);
integer a[n:0];
integer i;

function func(input a[n:0])
initial begin
a[0]=0;
a[1]=1;
$display("the fibonacci sequence of %0d is ",n);
$write("%0d\t %0d\t",a[0],a[1]);
for(i=2;i<=n;i=i+1)
begin
	a[i]=a[i-1]+a[i-2];
	$write("%0d\t",a[i]);	
end
$write("\n");
end
endfunction

integer x;
x=func(n);

endmodule
*/

module fibonacci #(parameter n = 10);

  function integer fib;
    input integer num;
    integer i, a, b, temp;
    begin
      a = 0;
      b = 1;
      if (num == 0)
        fib = 0;
      else if (num == 1)
        fib = 1;
      else begin
        for (i = 2; i <= num; i = i + 1) begin
          temp = a + b;
          a = b;
          b = temp;
        end
        fib = b;
      end
    end
  endfunction

  integer i;

  initial begin
    $display("Fibonacci sequence of %0d terms:", n);
    for (i = 0; i <= n; i = i + 1) begin
      $write("%0d\t", fib(i));
    end
    $write("\n");
  end

endmodule


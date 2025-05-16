module prime_or_not;
integer n=93;
integer i ;
reg prime_d;
initial begin
prime_d=1; // assume it is prime number
if(n==0 || n==1)
prime_d=0;
for(i=2;i<n/2;i=i+1)
begin 
	if((n%i==0)&& prime_d)
		prime_d=0;
	
end

if(prime_d==1)
$display("the number %0d is prime number",n);
else
$display("the number %0d is not prime number",n);
end
endmodule

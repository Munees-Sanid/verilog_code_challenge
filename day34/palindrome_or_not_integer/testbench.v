module pallindrome #(parameter integer org_num=134431);
integer num;
integer rem;
integer rev_num;
initial begin
num=org_num;
rev_num=0;
	while(num!=0)
		begin
			rem=num%10;
			rev_num=rev_num*10+rem;
			num=num/10;
		end
if(org_num==rev_num)
$display("the given number %0d is pallindrome",org_num);
else
$display("the given number %0d is not pallindrome",org_num);
end
endmodule

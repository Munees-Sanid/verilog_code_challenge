module fibonacci #(parameter n=23);
integer i;
integer first=0,second=1;
integer next;
initial begin
$display("the fibonacci sequence of %0d is ",n);
$write("%0d\t",first);
$write("%0d\t",second);
for(i=2;i<=n;i=i+1)
begin
	next=first+second;
	$write("%0d\t",next);
	first=second;
	second=next;
end
end
endmodule

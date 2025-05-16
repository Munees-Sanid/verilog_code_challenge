module fibonacci #(parameter n=12);
integer a[n:0];
integer i;
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
endmodule

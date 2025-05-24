module tb;
integer a[0:9];
integer i,j,temp;
initial begin
i=0;
while(i!=10)
begin
	temp={$random}%100;
	begin : loop
		for(j=0;j<i;j=j+1)
			
				begin
					if(a[j]==temp)
					disable loop;
					
				end
				a[i]=temp;
				i=i+1;
end
end

// sorting the array

for(i=0; i< 9; i=i+1)begin
	for(j=0 ; j < 9 ; j=j+1)begin
		if(a[j]>a[j+1])
			begin 
			 temp=a[j];
			 a[j]=a[j+1];
			 a[j+1]=temp;
			 end
		end
	end


for(i=0; i<10; i=i+1)
$display("a[%0d] = %0d",i,a[i]);
end

endmodule

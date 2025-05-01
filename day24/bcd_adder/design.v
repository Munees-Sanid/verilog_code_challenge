// design code for bcd adder

module bcd(
	input [3:0]a,b,
	input cin,
	output reg [3:0]sum,
	output reg cout);
reg [4:0]temp;

always@(a,b,cin)begin
	temp=a+b+cin;
	if (temp>9)
	begin 
		temp=temp+6;
		cout=1;
		sum=temp[3:0];
	end
	else begin
	cout=0;
	sum=temp[3:0];
	end
end
endmodule



// Name   : Munees Sanid
// Rollno : KVLSI2501076


// 1] function for factorial 

module tb;
reg [63:0]facto;
function automatic reg[63:0] fact(input reg [31:0]n );
begin 
if(n>1)
fact=fact(n-1)*n;
else
fact=1;
end
endfunction

initial begin
facto=fact(4);
$display("%0d",facto);
end
endmodule


// 2] function to create whether number is prime or not 

module tb;
integer n;
integer isprime=1;

function prime(input integer n);
integer i;
begin 
if(n==0 && n==1)
isprime=0;
else begin
for(i=2; i<n/2; i=i+1)
if(n%i==0)
isprime=0;
end
prime=isprime;
end
endfunction

initial begin
if(prime(11))
$display("it is prime");
else 
$display("it is not prime");
end
endmodule 


// 3] function for even and odd

module tb;
reg [3:0]num;
function even_or_odd(input num);
begin
if(num[0])
even_or_odd=1;
else
even_or_odd=0;
end
endfunction

initial begin
if(even_or_odd(7))
$display("The given number is odd");
else
$display("The given number is even");
end
endmodule




// 4] write a design code for 32*N+10;

module tb;
integer N=2;
wire[10:0]y;
assign y= (N<<5) +10;
initial #1 $display("%0d",y);
endmodule


// 5] write a frequency divider circuit by 5
module tb;
reg clk=0;
reg clk_out=0;
integer count=0;
always@(posedge clk or negedge clk)begin
count = count+1;
if(count==5)begin
clk_out = ~clk_out;
count=0;
end
end
always #5 clk=~clk;
initial begin
$dumpfile("dump.vcd");
$dumpvars(0,tb);
#100 $finish;
end
endmodule



// 6]  write task to generate clk

module tb;
reg clk=0;
	task cg();
		#2 clk=~clk;
	endtask
always cg();

initial 
	begin
		$dumpfile("dump.vcd");
		$dumpvars(0,tb);
		#100 $finish;
	end
endmodule


// 7] write a function which perform shifting by 2 position when ctrl =1 or vice versa

module tb;
reg ctrl;
reg [7:0] out;
function integer shift(input reg[7:0] n,input reg ctrl);
begin
if(ctrl)
shift = n>>2;
else 
shift = n<<2;
end
endfunction

initial begin 
out = shift(8'b1010_1000,1);
$display("%b",out);
end
endmodule


// 8] write a program which make asyn and syn using condition 

module dff_asyn_or_syn (
	input clk,rst,ctrl,d,
	output reg q);
);

always @(posedge clk or posedge rst) begin
    if (!ctrl) begin // asynchronous
        if (rst)
            q <= 0;
        else
            q <= d;
    end
end


always @(posedge clk) begin
    if (ctrl) begin // syncrhonous
        if (rst)
            q <= 0;
        else
            q <= d;
    end
end

endmodule



// 9] write a verilog code to generate 10 unique random number 0 to 100

module tb;
integer a[0:9];
integer i,j,temp;
initial begin
i=0;
while(i!=10)
begin
	temp={$random}%101;
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

for(i=0; i<10; i=i+1)
$display("a[%0d] = %0d",i,a[i]);
end

endmodule


















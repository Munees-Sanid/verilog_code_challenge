// case 1
/*module test;
integer a,b,c,d;
initial begin
 	a=100;
 	b=200;
 	c<=0;
 	a<=10;
 	b<=20;
 	a<=b; 	
 	b=50;
 	
 	end
 	
 
 initial begin
 #0
 b<=a;
 a<=b;
 a<=100;
 a=20;
 
 end
 
 initial $strobe("sim=%0t   ::   a=%0d   b=%0d  c=%0d  d=%0d",$time,a,b,c,d);

 endmodule
*/

// case 2

/*
module test;
integer a,b,c,d;

initial begin
 b<=a;
 a<=b;
 a<=100;
 a=20;
 
 end
 

initial begin
 	a=100;
 	b=200;
 	c<=0;
 	a<=10;
 	b<=20;
 	a<=b; 	
 	b=50;
 	
 	end
 	
 initial $strobe("sim=%0t   ::   a=%0d   b=%0d  c=%0d  d=%0d",$time,a,b,c,d);

 endmodule
 */
 
 // case 3
 
module test;
integer a,b,c,d;
initial begin
 	a=100;
 	b=200;
 	c<=0;
 	a<=10;
 	b<=20;
 	a<=b; 	
 	b=50;
 	
 	end
 	
 
 initial begin
 #0
 a=20;
 b<=a;
 a<=b;
 a<=100;

 
 end
 
 initial $strobe("sim=%0t   ::   a=%0d   b=%0d  c=%0d  d=%0d",$time,a,b,c,d);

 endmodule

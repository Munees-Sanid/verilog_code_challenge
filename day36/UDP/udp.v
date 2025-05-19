
// file path :: "/home/munees-sanid/github/verilog_code/day36/UDP/udp.v"
// Combinational UDP 

// UDP for OR - gate
primitive or_udp(y,a,b);
output y;
input a,b;
	table
		0 0 :0;
		1 ? :1;
		? 1 :1;
		
	endtable
endprimitive


// UDP for AND - gate
primitive and_udp(y,a,b);
output y;
input a,b;
	table
		? 0 :0;
		0 ? :0;
		1 1 :1;
		
	endtable
endprimitive


// UDP for NOT - gate
primitive not_udp(y,a);
output y;
input a;
	table
		0 :1;
		1 :0;
		
	endtable
endprimitive


// UDP for XOR - gate
primitive xor_udp(y,a,b);
output y;
input a,b;
	table
		0 0 :0;
		0 1 :1;
		1 0 :1;
		1 1 :0;
	endtable
endprimitive


// UDP for XNOR - gate
primitive xnor_udp(y,a,b);
output y;
input a,b;
	table
		0 0 :1;
		0 1 :0;
		1 0 :0;
		1 1 :1;
	endtable
endprimitive

// UDP for NAND - gate
primitive nand_udp(y,a,b);
output y;
input a,b;
	table
		? 0 :1;
		0 ? :1;
		1 1 :0;
		
	endtable
endprimitive



// UDP for NOR - gate
primitive nor_udp(y,a,b);
output y;
input a,b;
	table
		? 1 :0;
		1 ? :0;
		0 0 :1;
		
	endtable
endprimitive


// sequential UDP 

// UDP for d-latch active enable with synchronous high reset
primitive d_latch(q,t,rst,en);
output reg q;
input t,rst,en;
initial q=0;
	table
		? ? 0 :? :-;
		? 1 1 :? :0;
		0 0 1 :? :0;
		1 0 1 :? :1;
	endtable
endprimitive


// UDP for t-latch active enable with synchronous high reset
primitive t_latch(q,t,rst,en);
output reg q;
input t,rst,en;
initial q=0;
	table
		? ? 0 :? :-;
		? 1 1 :? :0;
		0 0 1 :? :-;
		1 0 1 :0 :1;
		1 0 1 :1 :0;
	endtable
endprimitive

// UDP for sr-latch active enable with synchronous high reset
primitive sr_latch(q,s,r,rst,en);
output reg q;
input s,r,rst,en;
initial q=0;
	table
		? ? ? 0 :? :-;
		? ? 1 1 :? :0;
		0 0 0 1 :? :-;
		0 1 0 1 :0 :0;
		1 0 0 1 :1 :1;
		
	endtable
endprimitive


// UDP for jk-latch active enable with synchronous high reset
primitive jk_latch(q,j,k,rst,en);
output reg q;
input j,k,rst,en;
initial q=0;
	table
		? ? ? 0 :? :-;
		? ? 1 1 :? :0;
		0 0 0 1 :? :-;
		0 1 0 1 :0 :0;
		1 0 0 1 :1 :1;
		1 1 0 1 :1 :0;
		1 1 0 1 :0 :1;
	endtable
endprimitive

// UDP for d-ff active clk with asynchronous high reset
primitive d_ff(q,d,rst,clk);
output reg q;
input d,rst,clk;
initial q=0;
	table
		? 1 ? :? :0;
		? (10) ? :? :-;
		0 0 (?1) :? :0;
		1 0 (?1) :? :1;
		? 0 (1?) :? :-;
		? 0 (?1) :? :-;
		? 0 (x0) :? :-;
		? 0 0 :? :-;
		? 0 (0x) :? :-;
	endtable
endprimitive

// UDP for t-ff active clk with asynchronous high reset
primitive t_ff(q, t, rst, clk);
output reg q;
input t, rst, clk;
initial q = 0;
table
  ? 1 ?     : ? : 0;
  ? (10) ?  : ? : -;
  0 0 (?1)  : ? : -;
  1 0 (?1)  : 0 : 1;
  1 0 (?1)  : 1 : 0;
  ? 0 (1?)  : ? : -;
  ? 0 (?1)  : ? : -;
  ? 0 (x0)  : ? : -;
  ? 0 0     : ? : -;
  ? 0 (0x)  : ? : -;
endtable
endprimitive

// UDP for sr-ff active clk with asynchronous high reset
primitive sr_ff(q, s, r, rst, clk);
output reg q;
input s, r, rst, clk;
initial q = 0;
table
  ? ? 1 ?     : ? : 0;
  ? (10) ?    : ? : -;
  0 0 0 (?1)  : ? : -;
  1 0 0 (?1)  : ? : 1;
  0 1 0 (?1)  : ? : 0;
  1 1 0 (?1)  : ? : x;
  ? ? 0 (1?)  : ? : -;
  ? ? 0 (?1)  : ? : -;
  ? ? 0 (x0)  : ? : -;
  ? ? 0 0     : ? : -;
  ? ? 0 (0x)  : ? : -;
endtable
endprimitive

// UDP for jk-ff active clk with asynchronous high reset
primitive jk_ff(q, j, k, rst, clk);
output reg q;
input j, k, rst, clk;
initial q = 0;
table
  ? ? 1 ?     : ? : 0;
  ? (10) ?    : ? : -;
  0 0 0 (?1)  : ? : -;
  1 0 0 (?1)  : ? : 1;
  0 1 0 (?1)  : ? : 0;
  1 1 0 (?1)  : 0 : 1;
  1 1 0 (?1)  : 1 : 0;
  ? ? 0 (1?)  : ? : -;
  ? ? 0 (?1)  : ? : -;
  ? ? 0 (x0)  : ? : -;
  ? ? 0 0     : ? : -;
  ? ? 0 (0x)  : ? : -;
endtable
endprimitive



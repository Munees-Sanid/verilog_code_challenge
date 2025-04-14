// Name        : Munees sanid
// Roll No     : KVLSI2501076
// Question No : B

module not_mux(input a, output y);
    assign y = a ? 1'b0 : 1'b1;
endmodule

module and2(input a, b, output y);
    assign y = a & b;
endmodule

module or2(input a, b, output y);
    assign y = a | b;
endmodule

module f_realization(input w1, w2, w3, output f);
    wire w1n, w3n;
    wire t1, t2, t3, t4;
    wire o1, o2;

    not_mux n1(w1, w1n);
    not_mux n3(w3, w3n);

    and2 a1(w1n, w3n, t1);
    and2 a2(w1, w3, t2);
    and2 a3(w2, w3, t3);
    and2 a4(w1, w2, t4);

    or2 o_1(t1, t2, o1);
    or2 o_2(t3, t4, o2);
    or2 o_3(o1, o2, f);
endmodule

module testbench;
    reg w1, w2, w3;
    wire f;

f_realization uut(w1, w2, w3, f);

initial begin
$dumpfile("dump.vcd");
$dumpvars(0, testbench);
end

initial begin
$monitor("Time=%0t  w1=%b w2=%b w3=%b :: f=%b", $time, w1, w2, w3, f);
end

initial begin
w1 = 0; w2 = 0; w3 = 0; #5;
w1 = 0; w2 = 0; w3 = 1; #5;
w1 = 0; w2 = 1; w3 = 0; #5;
w1 = 0; w2 = 1; w3 = 1; #5;
w1 = 1; w2 = 0; w3 = 0; #5;
w1 = 1; w2 = 0; w3 = 1; #5;
w1 = 1; w2 = 1; w3 = 0; #5;
w1 = 1; w2 = 1; w3 = 1; #5;

$finish;
end
endmodule

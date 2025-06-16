module tb;
initial begin
  fork
    begin : f1
       $display("th1");
       disable f2;
    end

    begin : f2
       $display("th2");
       disable f1;
    end
  join
end
endmodule


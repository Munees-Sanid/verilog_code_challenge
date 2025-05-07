module tb;
  integer arr[0:4];
  integer i, j, temp;

  initial begin
    arr[0] = 8;
    arr[1] = 3;
    arr[2] = 5;
    arr[3] = 1;
    arr[4] = 2;

    for (i = 0; i < 5; i = i + 1) begin
      for (j = 0; j < 5; j = j + 1) begin
        if (arr[j] > arr[j + 1]) begin
          temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        end
      end
    end

    $display("Sorted array:");
    for (i = 0; i < 5; i = i + 1)
       $display("%0d ", arr[i]);
   
  end
endmodule


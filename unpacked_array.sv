module test;
  
  bit [7:0]my_array;
  
  initial
    begin
		my_array=8'b11011101;
      $display("value of my_array is =%0d",my_array);
      
      for (int i=0;i<$size(my_array);i++)
        $display("my_array[%0d]=%0d",i,my_array);

      
    end
endmodule

//2D-packed array

module test;
  bit [3:0][7:0]my_array;
  
  initial
    begin
      my_array=32'hffaf_ffaf;
      
      $display("value of my_array=%0b",my_array);
      
      for(int i;i<$size(my_array);i++)
        $display("value of my_array[%0d]=%0b",i,my_array[i]);
      
      
    end
endmodule



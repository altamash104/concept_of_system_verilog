/*
Q. write a code to come out of the array in between while displaying.
*/
module test;
  int a[10]; //i have taken size of an array arbitrarily as 10

  initial
    begin
      int i;
      repeat(10)
        begin
        a[i]=$urandom_range(1,20);
        i++;
        end
          foreach(a[i])
            begin
          $display("a[%0d]=%0d",i,a[i]);
            
              if(i==($size(a))/2) // after iterating half of the element it will come out
          break;
          end
      end
endmodule

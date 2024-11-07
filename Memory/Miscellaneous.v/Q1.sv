/*
Q. write a code to come out of the array in between while displaying.
*/
module test;
  int a[10];
  
  initial
    begin
      int i;
      repeat(10)
        begin
        a[i]=$urandom_range(1,20);
        i++;
        end
      $display("//*************before using break************//");
      		foreach(a[i])
           $display("a[%0d]=%0d",i,a[i]);
          
      $display("//*************after using break************//");
      		foreach(a[i])
            begin
           if(i==($size(a))/2)
                break;
              $display("a[%0d]=%0d",i,a[i]);
                end
            end
endmodule

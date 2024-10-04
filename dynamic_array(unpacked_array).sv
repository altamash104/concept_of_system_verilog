module dynamic_array;
  int da1[];
  int da2[];
  
  initial
    begin
      da1=new[5];
      da1='{1,2,3,4,5};
     
      $display("value of dynamic array da1=%0p",da1);
      
        for(int i=0; i<$size(da1);i++)
        //foreach (da1[i])
        $display("da1[%0d]=%0d",i,da1[i]);
      
      //copying one da1 into da2
      
      da2=da1;
      
      $display("value of dynamic array da2=%0p",da2);
      
      //resizing of dynamic array
      
      da2=new[10](da1);
      $display("value of dynamic array after resizing da2=%0p",da2);
      
      //shuffling
      
      da1.shuffle();
      $display("value of dynamic array after shuffle da1=%0p",da1);
      
      //sorting
      
      da1.sort();
      $display("value of dynamic array after shorting da1=%0p",da1);
      
      //rsort;
       da1.rsort();
      $display("value of dynamic array after rshorting da1=%0p",da1);
      
      //reversing
      
       da1.reverse();
      $display("value of dynamic array after reversing da1=%0p",da1);
      
      //size of array
      da1.size();
      $display("size of an dynamic array da1=%0p",da1,$size(da1));
      
      end
  
endmodule
  

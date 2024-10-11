/*
1.An array whose size can be set or changed at runtime simulation
2.By default, the size of dynamic array is zero unless a new[] is used

	syntax: data_type  array_name[];
*/

module dynamic_array;
  int da1[];
  int da2[];
  int da[][];
  int i;
  
  initial
    begin
      da1=new[5];
      da1='{1,2,3,4,5};
      $display("value of dynamic array da1=%0p",da1); 
      //for(int i=0; i<$size(da1);i++)
        foreach (da1[i])
        $display("da1[%0d]=%0d",i,da1[i]); //for this type of display we have use foreach loop in order to print all values on every index

     /* 
     da1=new[5];
      //int i;
      repeat(5)//use repeat statement equal to the size of dynamic array otherwise it will insert zeros 
        begin
          da1[i]=$urandom_range(1,10);
          i++;
        end
		 $display("value of dynamic array da1=%0p",da1);
      	foreach (da1[i])
      	 $display("da1[%0d]=%0d",i,da1[i]);
*/
      
     //copying one da1 into da2
      
      da2=da1;
      
      $display("value of dynamic array da2=%0p",da2);

      //comparing da1 with da2
      
      if(da1==da2)
        $display("da1 and da2 are equal");
      else
        $display("da1 and da2 are not equal");
      
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

      //2D dimension dynamic array
      //3x4 dynamic array
      
      da=new[3];
      foreach(da[j])
        da[j]=new[4];
      foreach(da[i,j])
        da[i][j]=$urandom_range(1,100);
      $display("%0p",da);
      
    end
endmodule
  

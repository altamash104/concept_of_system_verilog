/*
1.It is a memory whose size is not known during compilation ,but instead is defined and expanded in as needed during the runtime.
2.A dynamic array is easily recognized by its empty square bracket[].
3.It is used in for small memory size upto range 1K to 1MB.
4.     declaration : bit [3:0] da[];
                      integer da[];
       memory allocation: da=new[4];
       da initializing :da={0,1,2,3} or '{0,1,2,3}
       dynamic array method: new[] Allocate the memory
       Return the size of an array : size()
       Delete all the elements of an array : delete()
*/
\\\\\\\\\\\\\\\\----- dynamic array initialization -----/////////////////////
module da_array();
  int da1[];
  integer i;
  
  initial
    begin
      da1=new[4];
     // da1='{1,2,3,4};
      
      //foreach loop or for loop for entering the elements into dynamic array
      
      foreach (da1[i])
        //da[i]=i // if we do like this we have to give value to da1='{1,2,3,4}
        da1[i]=$urandom_range(1,10);
      
      $display("elements of dynamic array via foreach loop da1=%0p",da1);
      
        for (i=0;i<$size(da1);i++)
        da1[i]=i;
      $display("elements of dynamic array via for loop da1=%0p",da1);
      
        foreach(da1[i])
        $display("da1[%0d]=%0d",i,da1[i]);
      end
endmodule
/*
Simulation output:
elements of dynamic array via foreach loop da1='{9, 1, 4, 1} 
elements of dynamic array via for loop da1='{0, 1, 2, 3} 
da1[0]=0
da1[1]=1
da1[2]=2
da1[3]=3
*/

\\\\\\\\\\\\\\\\---- dynamic  arraay methods ------////////////////////
module da_array();
  int da1[];
  int da2[];
  integer i;
  
  initial
    begin
      da1=new[5];
      da2=new[5];
      
      foreach(da1[i])
        da1[i]=$urandom_range(1,10);
      $display("elements of da1=%p",da1);
      
      //copy method
      da2=da1;
      $display("elements of da2=%p",da2);
      
      //resizing of dynamic array
      da2=new[10](da2);
      $display("elements of da2=%p",da2);
      $display("elements of da2=%0p",da2.size);
    
    end
endmodule
/*
Simulation output:
elements of da1='{9, 1, 4, 1, 8} 
elements of da2='{9, 1, 4, 1, 8} 
elements of da2='{9, 1, 4, 1, 8, 0, 0, 0, 0, 0} 
elements of da2=10
*/


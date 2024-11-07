//write a code to generate random dynamic array also find the values and occurance of array having elements greater than 30.
module tb;
  int da[];
  int q[$];
  
  initial
    begin
      da=new[$urandom_range(15,30)];
       
      foreach(da[i])
        da[i]=i*4;
      $display("da=%0p",da,$size(da));
      q=da.find with(item>30);
      $display("After calling find with item >30,q=%0p",q);
      
    end
endmodule

class test;
  rand int da[];
  constraint x{da.size==10;
               foreach(da[i])
                 da[i] inside{[1:20]};}
  
  function void post_randomize();
    $display("Before sorting the content of array is %0p",da);
  
  for(int i=0;i<10;i++)
    begin
      for(int j=0;j<10;j++)
        if(da[i]>da[j])
          begin
            da[i]=da[i]+da[j];
            da[j]=da[i]-da[j];
            da[i]=da[i]-da[j];
          end
    end
    //da.rsort();with method
    $display("After sorting the content of array is %0p",da);
  endfunction
endclass
  
  module top;
    test t;
    initial
      begin
        t=new();
        t.randomize();
      end
  endmodule

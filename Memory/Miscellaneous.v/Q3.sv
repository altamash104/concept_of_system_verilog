/*
write a constraint to generate 10 random number in an array.the range of each element should be between 10 to 30.
write a code to generate 10 elements in a queue with the following conditons.
  eg- queue[0]=array[0] -0 and queue[1]=array[1] and so on..
*/

class test;
  rand bit [4:0]array[10];
   bit[4:0] q[$];
  
  constraint c1 {foreach(array[i]) array[i] inside {[10:30]};}
  
  function void post_randomize()
    foreach(array[i])
      q.push_back(array[i]);
  endfunction
    
endclass

module top;
  test t;
  
  initial
    begin
      t=new;
      t.randomize();
      $display("%0p",t.array);
      $display("%0p",t.q);
    end
endmodule

/*
1.It is used when we have very limited resources so to use resources optimally we use semaphore.
2.It is a built in class.
3.It can be called in any class.
4.used for exclusion and synchronization.
Feature:
variable number of keys can be put and removed.
controlled access to shared object,such as sharing a bus from models
      semaphore sem ;
      sem=new[]//(optional_initial_keycount=0);
      sem.get//
      sem.put//
*/
module tb;
semaphore key=new(1);
initial
begin
repeat(2)
  begin
  fork
  begin
  $display("[A] process A trying to get the key %0t",$time);
  key.get(1);
  $display("[A] process A got the key %0t",$time);
  #10;
  key.put(1);
  $display("[A] process A return the key %0t",$time);
  #10;
   end

    begin
      $display("[B] process B trying to get the key %0t",$time);
      key.get(1);
      $display("[B] process B got the key %0t",$time);
      #10;
      key.put(1);
      $display("[B] process B put the key %0t",$time);
      #10;
    end
  join
  end
  end
  endmodule

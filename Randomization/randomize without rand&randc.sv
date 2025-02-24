class test;
  
   int a;
   bit b;
  
endclass
 
 module tb;
   test t;
   initial
     begin
       t=new;
       repeat(10)
         begin
           assert(t.randomize(a) with {a inside {[10:120]};})//here we didn't passed the value "b" so it will not be randomize 
             $display("%d",t.a);
         end
     end
 endmodule

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

////////////////////////////////////////////////////////////
//--> here one property is randomized but another is not then how will you randomize other property without passing as an argument to randomize key word 
class test;
  
   rand int a;
   int b;
  
  function void post_randomize();
    b=a;
  endfunction
                
endclass
 
 module tb;
   test t;
   initial
     begin
       t=new;
       repeat(10)
         begin
           t.randomize();
           $display("%d",t.b);
         end
     end
 endmodule

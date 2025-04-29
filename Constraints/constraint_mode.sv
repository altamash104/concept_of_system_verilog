/*
handle.constraint_identifier.constraint_mode(0)- disable constraint
handle.constraint_identifier.constraint_mode(1)-enable constraint
*/

class test;
  rand bit [3:0]a;
  rand bit [3:0]b;
  
  constraint c1{a inside {[1:5]};}
  constraint c2{b<10;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)
        begin
        	t.c1.constraint_mode(0);
      		t.randomize();
             $display("value of a=%0d, b=%0d",t.a,t.b);
        
        end
    end
    	
endmodule

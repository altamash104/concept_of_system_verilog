/*
In below example constraint name are different so it will randomize the range of value which lies between 20 and 30 it will not override 
*/
class parent;
  
  rand bit[15:0]a;
  constraint c1{a>=20;}

endclass

class child extends parent;
  constraint c2{a<=30;}
endclass

module test;

  child c_h;

  initial
   begin
    c_h=new;
     repeat(20)begin
    c_h.randomize();
    $display("a=%0d",c_h.a);
   end
   end
endmodule

/*
To override constraint the name of both base class and child class constraint should be same.
Another method to override constraint is using soft & inline constraint.
*/
class parent;
  
  rand bit[15:0]a;
  constraint c1{a>20;}

endclass

class child extends parent;
  constraint c1{a<20;}
endclass

module test;

  child c_h;

  initial
   begin
    c_h=new;
     repeat(20)begin
    c_h.randomize();
    $display("a=%0d",c_h.a);
   end
   end
endmodule
//here child class will override the base class constraint so that it will have only value more than 20.

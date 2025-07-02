/*
## Shallow copy-
1.only properties of parent class are copied not the objects of subclass.
2.changes made to the objects through one instance reflect in the other instance because they share the same underlying objects

## Deep copy-
1.Both data and Objects in the parent class are copied.
2.here user defined copy method is required.
3.This method creates new objects for properties, ensuring that changes made to one instance do not affect the other.
*/

//////////////////////Shallow copy///////////////////////
class A;
  
  int j=15;

  function A copy();//incase of shallow copy this user defined method is not required but it's there it causes no problem
    copy=new;
    this.j=j;
  endfunction
endclass  

class B;
  
  int  i=10;
  
  A a=new;
  
  function B copy();
    copy=new;
    this.i=i;
    this.a.j=a.j;
    endfunction
endclass

module shallow_copy;
  
  B b1,b2;
  
  initial
    begin
      
      b1=new();
      b2=new b1;
    
      b2.a.j=30;
      b2.i=20;
      $display("value of b1.i=%0d",b1.i);
      $display("value of b1.a.j=%0d",b1.a.j);
      $display("value of b2.i=%0d",b2.i);
      $display("value of b2.a.j=%0d",b2.a.j);
    end
endmodule
/*
value of b1.i=10
value of b1.a.j=30
value of b2.i=20
value of b2.a.j=30
change made in one instances b1 is visible to another instances b2.
*/
//////////////////////deep copy/////////////////////////

class A;
  int j=15;

  function A copy();
    copy=new;
    this.j=j;
  endfunction
endclass  

class B;
  int  i=10;
  A a=new;
  
  function B copy();// incase of  deep copy user defined method is required.
    copy=new;
    this.i=i;
    this.a.j=a.j;
    endfunction
endclass

module deep_copy;
  B b1,b2;
  initial
    begin
      b1=new();
      b2=new();
      
      b2=b1.copy();
      b2.a.j=30;
      b2.i=20;
      $display("value of b1.i=%0d",b1.i);
      $display("value of b1.a.j=%0d",b1.a.j);
      $display("value of b2.i=%0d",b2.i);
      $display("value of b2.a.j=%0d",b2.a.j);
    end
endmodule
/*
value of b1.i=10
value of b1.a.j=15
value of b2.i=20
value of b2.a.j=30
change made in one instances b1 is not visible to another instances b2.
*/

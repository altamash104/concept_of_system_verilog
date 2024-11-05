/*
1.An abstract class is an incomplete class that may contain method implementation or may contain only the prototype of methods without actual implementation (known as pure virtual methods). 
  It can not be instantiated and it can only be derived.
2.An abstract class is also known as a virtual class.
3.Method type, number of arguments, and return type (if required) should be the same for the virtual methods in their derived classes.
4.It is not mandatory to add methods in the abstract class.
5.for virtual class we can not allocate memory directly instead we need to extends another class from this virtual class will be 
non-virtual in nature then we can allocate memory.
->usage:Common methods can be placed in the abstract class and these methods can be inherited by derived classes.
pure virtual class- it is a prototype without body once a method declared pure virtual it has to be override 
other wise it will throw error.
*/

virtual class test;
  virtual function void altamash(); //child class may override or may not override,there is no compulsion
    $display("Hello");
  endfunction
  pure virtual function void james();  //child class has to override this method,there is compulsion
endclass

class amol extends test;
 function void altamash();
    $display("Hello Altamash");
  endfunction
 function void james();
        $display("Hello,I am James");
  endfunction
endclass

module top;
  amol a;
  initial
    begin
      a=new;
      a.altamash;
      a.james;
    end
endmodule

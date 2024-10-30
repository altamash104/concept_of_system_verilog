/*
1.The super keyword is used from within a sub-class to refer to properties and methods of the base class.
2.It is mandatory to use the super keyword to access properties and methods if they have been overridden by the sub-class.
3.With super keyword, it is allowed to access the class members of parent class which is only one level up.
4.If the method of the parent class is overridden in the child class, then using the ‘super’ keyword parent class method can be accessed from the child class.
5.In nutshell super keyword used to override the base class method and access the method of base class. 
*/
class Parent;
  int addr;

  function display ();
    $display ("[parent] addr=0x%0h", addr);
  endfunction
endclass

class child extends Parent;
  function display();
    super.display(); // Calling parent class display method using super keyword
    $display ("[Child] addr=0x%0h", addr);
  endfunction

  /*function new (); //here we can mention "new" method explicitly of class in any class by using this.
    super.new ();//also refering to parent class "new" method.
  endfunction*/
endclass

module tb;
 	Parent p;
  	child c;

  	initial begin
      c = new();
      p = new();
      c.display();
    end
endmodule



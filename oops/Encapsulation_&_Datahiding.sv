/*
1.Data encapsulation is a mechanism that combines properties and methods of a class.
2.Data hiding is a mechanism to hide class members within the class.They are not accessible outside of class scope. 
This avoids class member modification outside the class scope and its misuse.
--> Local :If a class member is declared as a local, they will be available to that class alone. 
    The child classes  including immediate child will not have access to a local class member of their parent class.
-->Protected :protected members and method can be accessed  with in immediate extended class only.
-->Public: these members can  be accessed by any extended class

*/
///////////////   local   /////////////
class local_encapsulation;
  bit [31:0] packet;
  local int parity;

  function void display();
    $display("packet = %0d and parity = %0d", packet,parity);
  endfunction
endclass

module class_example;
  local_encapulation tr;
  
  initial begin
    tr = new();
   
    tr.packet = 100;
    tr.parity = 0;
    
    tr.display();
  end
endmodule
/////////////   private    ///////////////
class transaction;
  bit [31:0] data;
  int id;

  function new();
    data = 100;
    id = 1;
  endfunction
  
  protected function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass

class child_trans extends transaction;
  bit [31:0] addr;
  
  task calc_addr;
    addr = data * id;
    display();  // child class is accessing protected access method of parent class
    $display("addr = %0d", addr);
  endtask
endclass

module class_example;
  child_trans tr;
  
  initial begin
    tr = new();
    tr.calc_addr();
  end
endmodule

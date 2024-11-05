/*
1.It is a concept that allow to extends a child class from parent class.
2.child class will have the access to all the properties and methods of the parent class.
*/
class parent;
  int a;
  function void parent();
    $display("I am Parent");
  endfunction
endclass

class child extends parent;
  
  function void child();
    $display("I am child class");
  endfunction
endclass
  module inheretance();
    child c_h;
    initial
      begin
        
        c_h=new();
        c_h.parent();
        c_h.child();
        
        
        c_h.a=10;
        $display("value of a=%0d",c_h.a);
      end
  endmodule

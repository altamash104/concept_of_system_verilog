/*
1.polymorphism in sv provides an ability to an object to take on many form.
2.polymorphism and inheretance differ from each other in way that in case of polymorphism method name should be same and virtual.
3.final keyword is used to stop further overriding of extended class.
*/
class parent ;
  virtual function void display();
    $display("I am the parent");
  endfunction
endclass

class child;
  virtual function void display();
    $display("I am your child");
  endfunction
endclass

module polymorphism;
  parent p_h;
  child c_h;
  initial
    begin
      p_h=new;
      p_h.display():
    end
endmodule

/*
A parent class handle is assigned to the child class (child_class_handle = parent_class_handle)
*/

class parent;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Base: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child extends parent;
   
  function void display();
    $display("Child: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

module class_example;
  initial begin
    parent p_h;
    child c_h;
    c_h = new();

    p_h = c_h; // or $cast(p_h, c_h);
    $cast(c_h, p_h);

    p_h.data = 10;
    p_h.id   = 1;
    
    c_h.data = 5;
    c_h.id   = 2;
    
    c_h.display();
  end
endmodule
/*
Child: Value of data = 5, id = 2
*/

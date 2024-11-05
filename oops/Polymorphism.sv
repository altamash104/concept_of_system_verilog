/*
1.polymorphism in sv provides an ability to an object to take on many form.
2.polymorphism and inheretance differ from each other in way that in case of polymorphism method name should be same and virtual.
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

/*
A nested class declaration makes the inner class declaration local to the outer class. 
This means only the outer class can see it. 
SystemVerilog already has packages that provide similar functionality,
which is why we rarely see nested classes. 
*/
class x;
int a;
  class y;
    int g;
    //$display("inside class") if try to display this it will throw error
  endclass
  y y_h;// we can declare handle only in the class(x) where it is nested
endclass
module test;
      x x_h;
    initial
      begin
        x_h=new;
        $display("classs");
      end
endmodule
    

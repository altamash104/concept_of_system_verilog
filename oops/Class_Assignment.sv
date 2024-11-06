/*
--> Class is an encapsulation of properties and methods.
--> Instance of class is called object.
--> Object is pointed by handle.
--> Object is created by the class constructor-new();
*/
////////////////////////////////////////////////////
class transaction;
  bit [31:0] data;
endclass

module class_example;
  transaction tr1, tr2; // Instance of classes
  initial begin
    tr1 = new(); // Object is created by the class constructor 
    tr1.data = 5;
    tr2 = tr1; // handle assignment
    $display("tr1.data = %0h", tr1.data);
    $display("tr2.data = %0h", tr2.data);
    
    tr2.data = 10;
    $display("tr1.data = %0h", tr1.data);
    $display("tr2.data = %0h", tr2.data);
  end
endmodule

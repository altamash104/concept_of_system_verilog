/*
"super.new" keyword is used when child don't have properties so child can access the properties of parent 
 as example child doesn't has property so it access the parent property.
*/
class parent ;
  int a;
  
  function new(int b);
    	a=b;
    $display("value of a is %0d",a);
  endfunction
endclass

class child extends parent;;
  function new(int c);
    super.new(c);
    endfunction
endclass

module test;
  child c_h;
  initial
    begin
      c_h=new(100);//this value will go to super.new(c)which is refering to constructor of parent class constructor new(int b)
                    // so value of b is 100 since a=b value of a becomes a =100
    end
endmodule

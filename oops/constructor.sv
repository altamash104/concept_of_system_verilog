/*
--> It will allocate memory for blueprint class.
--> Return the address of the memory [pointer] to handle.
--> Initialize all the properties [default/user defined values].
--> Every class has default construtor if we are not writing  explicitly "function new" it will have default constructor implicitly.
--> constructor don’t have a return type.
*/
//////////////explicity defined constructor///////////
class test;
  bit [3:0] addr;

  //The new() function is called a class constructor and is a way to initialize the class variables with some value. 
  //it does not have a return type and is non-blocking.
  function new ();
    addr = 10;
  endfunction
endclass

module top;
  test t; 
  initial 
    begin
     t= new;
      $display ("addr=%0d", t.addr);
    end
endmodule
/*
simulation output : data=10; since it is intialize by value 10 in explicitly called "function new" constructor.
*/
////////////////implicitly defined constructor ///////////

class test;
	bit [3:0] addr;
  //the  function new() is not defined here
endclass

module top;
 test t;
  	
	initial 
    begin
		t = new;
  // When the class object is instantiated, then the constructor is
  // implicitly defined by the tool and called
      $display ("addr=%0d", pkt.addr);
	end
endmodule
/*
If the class does not have a new() function explicitly coded, an implicit new method will be automatically provided. 
In this case, addr is initialized to zero since it is of type bit for which the default value is zero.
simulation output: 0
*/

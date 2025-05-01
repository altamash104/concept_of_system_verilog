/*
1.Static casting:In case of static casting we do not check the compability.
here we change one data type to anoher data type.
2.static cast truncates the least significant bits of the source value.
3.

      syntax:  '(value, variable,expression)
dynamic casting: In case of dynamic casting we check compatibility before making illegal assignment in to legal assignment.
it can be use das function and task.
      
      synatax- $cast(destination ,source);
      note: data type of both source and destination shoulb be same.
*/
///////////////////static casting////////////////////
module top;
  
  int i_num1;
  real r_num2;
  
  initial
    begin
      i_num1= int'(10.0-1.2);
      $display("the integer value of i_num1=%0d",i_num1);
          r_num2= real'(5/2);// here we are dividing integer by integer so we will get real'(2)
      $display("the integer value of i_num1=%0.3f",r_num2);
               
    end
endmodule

/*
the integer value of i_num1=9
the integer value of i_num1=2.000 //static casting only do type conversion ,it does not preserve value.
*/
///////////////////////to get floating value////////////////////
module top;
  
  int i_num1;
  real r_num2;
  
  initial
    begin
      i_num1= int'(10.0-1.2);
      $display("the integer value of i_num1=%0d",i_num1);
          r_num2= real'((5.0)/2);// here we are dividing real by integer so we will get real'(2)
      $display("the integer value of i_num1=%0.3f",r_num2);
               
    end
endmodule

/*
the integer value of i_num1=9
the integer value of i_num1=2.500 //static casting only do type conversion ,it does not preserve value.
*/

////////////////////////////////////////////////////
class parent;
    virtual task print();
        $display("calling from parent class");
    endtask
endclass

class child extends parent;
    task print();
        $display("calling from child class");
    endtask
endclass

module casting();
    initial
    begin
        int x;
        parent p_obj;
        child c_obj1, c_obj2;

        x = 45.23; // this is  implict static casting
        $display("x = %0d", x);

       x = int'("s"); //explicit static casting
        $display("x = %0d", x);

        p_obj = new();
        c_obj1 = new();

        //upcasting
        p_obj = c_obj1;
        p_obj.print();
    

        // explicit dynamic casting (downcasting)
        if($cast(c_obj2,p_obj))
        begin
            $display("casting was successfull!!");
            c_obj2.print();
        end
        else
            $error("cast unsuccessfull!");
    end
endmodule

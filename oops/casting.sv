/*
Static casting:In case of static casting we do not check the compability.
here we change one data type to anoher data type.

      syntax:  '(value, variable,expression)
dynamic casting: In case of dynamic casting we check compatibility before making illegal assignment in to legal assignment.
it can be use das function and task.
      
      synatax- $cast(destination ,source);
      note: data type of both source and destination shoulb be same.
*/

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

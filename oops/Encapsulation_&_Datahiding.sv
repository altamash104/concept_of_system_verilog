/*
1.Data encapsulation is a mechanism that combines properties and methods of a class.
2.Data hiding is a mechanism to hide class members within the class.They are not accessible outside of class scope. 
This avoids class member modification outside the class scope and its misuse.
--> Local :If a class member is declared as a local, they will be available to that class alone. 
    The child classes  including immediate child will not have access to a local class member of their parent class.
-->Protected :protected members and method can be accessed  with in immediate extended class only.
-->Public: these members can  be accessed by any extended class

*/
//////////////////////////////////////////////////////
class parent_trans;
    local logic[1:0]a;
    protected logic[1:0]b;

    protected function void display();
        $display("a=%0d, b=%0d",a,b);
    endfunction

    function void update (logic [1:0]a,b);
        this.a=a;
        this.b=b;
    endfunction
endclass

class child_trans extends parents_trans;
    logic[1:0]c;
    
    function void calc();
        super.display();
        super.a=2;
        super.b=1;
    endfunction

endclass
 module test;
     parent_trans par_h;
     child_trans c_h;
     par_h=new();

     par_h.a=2;
     par_h.b=2;

     par_h.update(1,2);
     c_h=new();
     c_h.update(2,3);
     c_h.display();
     c_h.calc();
     end
 endmodule

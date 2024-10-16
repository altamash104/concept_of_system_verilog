/* 
## FUNCTION
1.It is a subroutine which is used to perform a set of instructions to be executed and called whenever needed.
2.The argument has to be input type and atleast one has to be passed.
3.It can enable another funtcion only can not enable other task .
4.It should be executed in zero simulation time and can not have delay(@,#,wait) , timing or timing control statements.

##TASK
1.It is a subroutine which is used to perform a set of instructions to be executed and called whenever needed.
2.The argument can be input,output or inout and have zero or more than one argument.
3.It can enable another function as well another task.
4.It may be executed in zero simulationor non zero simulation time and can include delay.

#IMPROVEMNET IN SV
1.Multiple statement in a task/function do not require begin_end block
2.function can have output and inout ports.
3.function can be void type (no need to return any value)
4.Passing arguments by reference(ref) and by the value are possible.
5.Task/Function arguments can be passed by name or order or position.
6.Default task and function arguments values are allowed.
*/
////////////////////////////////////////////////////
module my_function1;
  int s;// store the value of sum 
  function int sum(input int a,b);
    //input int a,b;// we can also declare formal arguments like this 
    sum=a+b;
    //return a+b //we do not assign a+b to the name of function "sum" then it will return value like this way 
  endfunction
  
  initial
    begin
      s=sum(10,5);
      $display("value of s=%0d",s);
    end
endmodule
////////////////////////////////////////////////////
module my_function2;
  function void display;
    $display("Hello world",$time);
  endfunction
             
  initial
    begin
      #10;
       display();
      #20;
       display();
    end
endmodule

///////////////////////////////////////////////////
module my_function3;
  int s;
  
  function void sum(input int a,b , output int y);
    //input int a,b; output int y;
    y=a+b;
  endfunction
  
  initial
    begin
      //s=sum(10,5);//wrong approach void incase of void function
      sum(10,5,s);
      $display("value of s=%0d",s);
    end
endmodule
//////////pass by value/////////////////

module pass_by_value;
  int x,y,z;
  
  function int sum(int x,y);
    x=x+y;//x=50  the change in the value of  arguments x ,y will not be visible outside the function
    y=x+y;//y=80
    return x+y;//((x+y)+y)=130
  endfunction
    
    initial
      begin
        
        x=20;
        y=30;
        $display ("x=%0d y=%0d",x,y);
        z=sum(x,y);
        $display ("x=%0d y=%0d z=%0d",x,y,z);
      end
    endmodule
/*
Simulation result
x=20 y=30
x=20 y=30 z=130
*/
////////////////////////////////////////////////////
module pass_by_ref;
  int x,y,z;
  
  function int sum(ref int x,y);
    x=x+y;//x=50  the change in te value of arguments x ,y will also be visible outside the function
    y=x+y;//y=80
    return x+y;//((x+y)+y)=130
  endfunction
    
    initial
      begin
        
        x=20;
        y=30;
        $display ("x=%0d y=%0d",x,y);
        z=sum(x,y);
        $display ("x=%0d y=%0d z=%0d",x,y,z);
      end
    endmodule
/*
Simulation result
x=20 y=30
x=50 y=80 z=130
*/
////////////////////////////////////////////////////////
module defalue_value;
  int x,y,z;
  function int sum(int x=5,y=10,z=15);
    x=x+y+z;//x=30
    return x+y //(x+y+y)//30+10=40
  endfunction

  initial
    begin
      $display(sum());

    end
endmodule

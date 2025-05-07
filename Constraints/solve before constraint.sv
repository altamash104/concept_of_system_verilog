/*
solve before constraint is a directive in SystemVerilog that specifies the solve order between random variables.

It means:
The randomizer will first solve the value of one variable,(solvw x before y means means first a will be solved the constraint will be applied)
Then it will solve the constraint for the second variable.
This ensures that there is no violation of dependencies between them.
It actually reduces the repeatition of randomization in order to get perfect result.
*/
class trans;
  rand bit x;
  rand bit [3:0]y
  constraint c1{solve x before y;}
  constraint c2{(x==1)-> y==0;}
endclass

module top;
  trans t_h;
  initial
    begin
      t_h=new;
     // repeat(50)
        repeat(5)
        begin
        t_h.randomize();
          $display("x=%0d,y=%0d",t_h.x,t_h.y);
        end
    end
endmodule
/*
Earlier with out solve before constraint  we are geting the value of x=1,y=0 after 50 repeatition
After using solve before constraint we are getting it in just 5 repeatition.
*/
          

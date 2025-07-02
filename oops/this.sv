/*
when have ambiguity between LHS AND RHS property or we can say class property and local property of the function we use this keyword  

*/
class this_keyword;
  int a,b;
  
  function void display();
    $display("value of a=%0d b=%0d",a,b);
  endfunction

  function new(int a,b);
    this.a=a;
    this.b=b;
  endfunction
endclass

module top;
  this_keyword  t_h1 ,t_h2;

  initial
    begin
      t_h1=new(20,30);
      t_h1.display();

      t_h2=new(5,10);
      t_h2.display();
    end
endmodule
/* 
value of simulation
  value of a=20 b=30
  value of a=5 b=10

with out this keyword
  value of a=0 b=0
  value of a=0 b=0
*/
    

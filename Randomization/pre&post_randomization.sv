/*
1.Every class has a built in method randomize() 
2.pre and post randomization are built in method automatically called before and after randomization. 
3.they are like call back hooks which changes the behaviour of the ouput randomized item  without actually making change in randomize fumction.
4.Randomize() is a virtual function.
*/

class test;
  rand bit[3:0]a;
  rand bit [3:0]b;
  bit [5:0]y;

  function void pre_randomize();
    $display("pre_randomization values a=%0d b=%0d",a,b);
  endfunction

  function void post_randomize();
    y=a+b;
    $display("post_randomization a=%0d b=%0d y=%0d",a,b,y);
  endfunction

endclass

module top;
  test t_h;

  initial
    begin
      t_h=new();
      t_h.randomize();
      $display("after randomization a=%0d b=%0d",t_h.a,t_h.b);

    end
endmodule
/*
pre_randomization values a=0 b=0
post_randomization a=9 b=12 y=21
after randomization a=9 b=12
*/
    

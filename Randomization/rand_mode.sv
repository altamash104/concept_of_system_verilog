/*
rand_mode() -1(by default)
rand_mode(0)-0(disabled)
*/

class test;
  rand bit [15:0] a;
  rand bit [3:0] b;

endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)
        begin
          t.a.rand_mode(0);// disable the randomization of variable "a"
          t.randomize();
          $display("randomize value of a=%0d b=%0d",t.a,t.b);;

    end
  end
endmodule
  
  

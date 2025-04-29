/*
1.constraint restrict the random data generation to meaning values.
2.constraint are declarative and bidirectional code
syntax- constraint_identifier{constraiint expression[];}
*/
class test;
  rand bit [3:0]a;
  rand bit [3:0]b;
  
  constraint c1{a>5;}
  constraint c2{a<10;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize();
      $display("value of a=%0d, b=%0d",t.a,t.b);

    end
endmodule
  

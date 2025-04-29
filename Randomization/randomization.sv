class test;
  rand bit [15:0] a;
  rand bit [3:0] b;

endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize();
      $display("randomize value of a=%0d b=%0d",t.a,t.b);;

    end
  end
endmodule
  
  

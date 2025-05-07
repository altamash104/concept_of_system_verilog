/*
It is used when we have to call randomization directly into module.
*/
module test;
  int a,b;
  bit success;
  
  initial
    begin
      
      success=std::randomize(a,b) with{a>10;a<20;b<100;b>50;};
      $display("a=%0d ,b=%0d",a,b);
    end
endmodule

/*Note- string and real data type can not be randomize
By calling  randomization in the argument list we can randomize  a variable that is not declared as rand or randc*/

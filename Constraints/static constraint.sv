/*
It will be commonly shared for all handles.
*/
class trans;
  rand bit [3:0]addr;
  static constraint addr_range{addr>8;}
endclass
module top;
  trans t_h1,t_h2;
  initial
    begin
    t_h1=new;
      t_h2=new;
      t_h1.randomize(); //addr>8
      t_h2.randomize();
      $display("",);
    end
endmodule

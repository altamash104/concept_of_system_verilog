/*
It is used when we have set of number and with in that range  we have to randomize.
syntax- constraint support_identifier{ variable inside {set of legal values};}
*/
class transaction;
  rand bit [3:0]addr;
  constraint c{addr inside {3,7,[11:15]};}
endclass

module top;
transaction t_h
  initial
    begin
      t_h=new();
      t_h.randomize()
      $display("addr=%0d",t_h.addr);
    end
endmodule

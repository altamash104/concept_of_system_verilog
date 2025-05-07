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

/*
set membership of an array
*/
class transaction;
  rand bit [3:0]addr;
  bit[3:0] addr_previous[]={1,2,3,5,8,10,11};
  constraint c{addr inside {addr_previous};}
endclass

module top;
  transaction trans_h;

  initial
    begin
      trans_h=new;
      trans_h.randomize();
      $display("addr=%0d",trans_h.addr);
    end
endmodule

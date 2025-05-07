/*
Hard Constraint- we can't ignore them.
soft constraint- we can ignore them.
*/

class trans;
  rand bit[3:0]addr;
  constraint addr_range{soft addr>15;}
endclass

module test;
  initial
    begin
      trans t_h;
      t_h=new;
      repeat(2)
        begin
          t_h.randomize() with {addr<15;};//Even though the constraint are conflicting , randomization  will not fail as we declared constraint as soft & randomize value is less than 15.
          $display("addr=%0d",t_h.addr);
        end
    end
endmodule

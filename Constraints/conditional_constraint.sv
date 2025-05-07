/*
conditional constraints restrict the variable based on condition.
    implication  (->)
    if/else
    constraint constraint_identifier{[expression]->{constraint set};}
*/
class transaction ;
  rand bit[7:0] addr;
  bit mode;
  constraint range{mode==1'b1->addr<96;mode==1'b0->addr<1024;}
endclass

module top;
  transaction t_h;
  initial
    begin
    t_h=new;
      repeat(20)
        begin
         t_h.mode=1'b1;
       //t_h.mode=1'b0;
      t_h.randomize();
      $display("addr=%0d",t_h.addr);
        end
    end
endmodule

///////////// using if/else ////////////////////////
class transaction ;
  rand bit[7:0] addr;
  bit mode;
  constraint range{if(mode==1'b1)
                  addr<96;
                   else if(mode==1'b0)
                     addr<1024;}
endclass

module top;
  transaction t_h;
  initial
    begin
    t_h=new;
      repeat(20)
        begin
         t_h.mode=1'b1;
       //t_h.mode=1'b0;
      t_h.randomize();
      $display("addr=%0d",t_h.addr);
        end
    end
endmodule

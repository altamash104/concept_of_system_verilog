/*
1.Distribution constraints are used to provide weightage to the random values.
2.Operator ":=" assign weight to the item; if a range, assign weight to every value in the range.
eg-[100:200] := 200 //each item(101,102,etc) gets a weight of 200.

3.Operator ":/" assigns weight to the item ; if a range ,assigns weight to range as whole.
eg-[101:200] ":/200" //each  item(101,102) gets a weight of 2(200/100=2).

Default weight is "1"

syntax- constraint_identifier{variable dist {set of legal values and weight};}
*/
class transaction;
  rand int addr ;
  constraint c{addr dist{7:=5,[11:20]:=3,[26:30]:/5};}
endclass
module top;
  transaction t_h;
  initial
    begin
      t_h=new;
      t_h.randomize();
      $display("addr=%0d",t_h.addr);
    end
endmodule
  /*
  7 has a weight of 5.
  11-20 each have a weight of 3.
  26-30 has a weight of 1.
  */

/*
1.It is used restrict the range of randomization.
2.Class constraint are permanent constraint.we can disable it sice they are named constraint.
3.Inline constraint temporary constraint.
4.These contraint are "temporary or one time " in nature used with randomization function directly without any name to it.
5.Since it is not a named constraint it can not be disabled.
6.Inline constraint will also override class constraint.
*/

class trans;
  rand bit [7:0] data;
  constraint data_range { data inside {[0:255]};}
endclass

module top;
trans t_h;
  initial
    begin
      repeat(10)begin
	      trans t_h = new();
        t_h.randomize() with { data < 100; }; // data 0 to 99 only for this call
        $display("data=%0d",t_h.data);
      end
    end
endmodule

class trnas;
  rand bit[3:0]addr;
  constraint valid_addr;
endclass
constraint trans ::valid_addr{addr<10;}
module top;
  trans t_h;
  initial
    begin
    t_h=new;
      repeat(5)begin
        
      t_h.randomize() with{addr<5;};
      $display("addr=%0d",t_h.addr);
      end
    end
endmodule

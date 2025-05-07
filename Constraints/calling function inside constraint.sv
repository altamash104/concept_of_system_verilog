class trans;
  rand bit[3:0]s_addr;
  rand bit[3:0]e_addr;

  constraint valid_e_add{e_addr==addr_calc(s_addr);}
  function bit[3:0]addr_calc(bit[3:0]a_addr);
    if(s_addr>8)
      addr_calc=0;
    else
      addr_calc=s_addr+2;
  endfunction
endclass

module top;
  test t_h;
  initial
    begin
      repeat(10)begin
      t_h.randomize();
        $display("start_addr=%0d end_addr=%0d",t_h.start_addr,t_h.end_addr);
      end
    end
endmodule
  

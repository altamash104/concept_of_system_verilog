/*
1.Polymorphism in sv provides an ability to an object to take on many form.
2.it allow parent to access child class method and properties.
3.polymorphism and inheretance differ from each other in way that in case of polymorphism method name should be same and virtual.
*/
class parent ;
  virtual function void display();
    $display("Parent class method");
  endfunction
endclass

class child extends parent;
   virtual function void display();
     $display("child class method");
  endfunction
endclass

module casting;
  parent p_h;
  child c_h1,c_h2;
  
  initial
    begin
      p_h=new;
      c_h1=new;
      c_h2=new;
      
      p_h=c_h1;//this is legal assignment
      
      if($cast(c_h2,p_h))//actualy here after assignment of p_h=ch_1 ,parent becomes child both have same type 
        begin
          p_h.display();//access child class method
          c_h1.display();//
        end
    end
endmodule

/*
child class method
child class method
*/

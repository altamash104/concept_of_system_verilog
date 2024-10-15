/*
1.Associative array is used where the size of the collection is unknown or data is sparse.
2.In associative array memory can be allocated when it is required.
3.Element of an array can be of any type we can store the concatenation of various data type or class structure as well.
4.it is used when we use "large memory" of the order of Giga Bytes.
    syntax: data_type array[index_type];
    note:- Index type of associative array can be "string", "bit" ,"int","byte",enum only.
    note:- If index type is not integer then in foreach or for loop it will iterate alphabatically.
5.Associative arrays are excellent for creating lookup tables or mapping values.For instance, you can use them to store configuration settings. 
*/

//initialization of associative array
module test;
  
  int a_array[int];
        
        initial
          begin
            int i;
            repeat(20)
              begin
                a_array[i]=$urandom_range(1,100);
                 i=i++;
              end
            foreach(a_array[i])
              $display("a_array[%0d]=%0p",i,a_array[i]);
            $display("value of a_array:=%0p",a_array);
                
          end
  
endmodule

//exaple1
module a_array;
  
  int a_array1[string]; //integer array with string index
  string a_array2[string]; //string array with string string index
  
  initial
    begin
      a_array1='{"Digital":5,"Verilog":10,"systemverilog":20,"UVM":30};
      a_array2='{"Name":"Altamash","Sub":"SV","year":"2024"};
      
      foreach(a_array1[i])
        begin
          $display("a_array1[%0s]=%0d",i,a_array1[i]);
        end
       $display("\n size of an array1 is %0d",a_array1.size());
       $display("------------------------------------------");
      
      
       foreach(a_array2[i])
         begin
           $display("a_array1[%0s]=%0d",i,a_array2[i]);
         end
      $display("\n size of a_array2 is %0d",a_array2.size());
      $display("------------------------------------------");
    end
endmodule

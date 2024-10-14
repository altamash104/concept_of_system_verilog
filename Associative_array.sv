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
        

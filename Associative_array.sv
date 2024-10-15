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
       $display("size of an array1 is %0d",a_array1.size());
       $display("------------------------------------------");
      
      
       foreach(a_array2[i])
         begin
             $display("a_array1[%0s]=%0s",i,a_array2[i]);
         end
      $display("size of a_array2 is %0d",a_array2.size());
      $display("------------------------------------------");
    end
endmodule

//methods of associative array

module a_array_methods;
  bit[7:0] array[int];
  int index;
  
  initial
    begin
      array[4]=2;
      array[10]=5;
      array[6]=7;
      array[20]=8;
      array[13]=9;
      array[16]=12;

       //we can also write the array like this       
      //array='{4:2,10:5,6:7,20:8,13:9,16:12};
      
      foreach(array[i])
        $display("array[%0d]=%0d",i,array[i]);
      
      //Print array size and number of enteries
      
      $display("size of an array =%0d,number of entries=%0d",array.size(),array.num());
      
      //exists method
      
      if(array.exists(4))
        $display("An element exists at index=4");
      else
        $display("An element doesn't exist at index=4");
      if(array.exists(11))
        $display("An element exists at index=11");
      else
        $display("An element doesn't exist at index=11");
      
      //first method
      
      array.first(index);
      $display("first index of array=%0d",index);
      
      //last method
      array.last(index);
      $display("last index of array=%0d",index);
      
      //prev index
      index=13;
      array.prev(index);
      $display("previous index of 13 is =%0d",index);
      
      //next index
       index=13;
      array.next(index);
      $display("next index of 13 is =%0d",index);
      
      //array delete index
      
      array.delete(10);
      $display("After deleting element having index 10");
      foreach(array[i])
        $display("array[%0d]=%0d",i,array[i]);
      $display("----------------------------");
      
      //deleting complete array
      
      array.delete();
      $display("size=%0d of array",array.size());
 
    end      
endmodule

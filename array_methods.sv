/*
1.Array locator methods operates on queques,unpacked arrays and their return type is queue.
2.Element locator and Index locator iterates over all elements in an array and then it is used to evaluate the expression specified "with" clause and return element in queue.
3.for some method with are optional.
*/
module array_locator;
  int array[];
  int array1[5]='{10,20,30,40,50};
  int array2[8]='{1,1,2,3,3,4,5,5};
  int q[$];

  initial
    begin
      int i;
      array=new[8];
      repeat(8)
        begin
          array[i]=$urandom_range(1,50);
          i++;
        end
      
      $display("value of array=%0p",array);
      
      //element locator methods
      
      q=array.find with(item <20);
      $display("element less than 20: q=%0p",q);
      
      q=array.find with(item>20);
      $display("element greater than 20 q=%0p",q);
      
      q=array1.find_first with (item>20);
      $display(" first element :q=%0p",q);
      
      q=array1.find_first with (item>20 & item<50);
      $display(" first element :q=%0p",q);
      
      q=array1.find_last with (item>20);
      $display(" first element :q=%0p",q);
      
      q=array1.find_last with (item>20 & item<50);
      $display(" first element :q=%0p",q);
      
      q=array2.unique(); // with clause is optional in this case
      $display("unique values are:q=%0p",q);
      
       q=array2.min(); // with clause is optional in this case
      $display("min values are:q=%0p",q);
      
      
       q=array2.max(); // with clause is optional in this case
      $display("min values are:q=%0p",q);
      
      //index_locator methods
      
      q=array2.find_index with (item>3);
      $display("index value greater than three:q=%0p",q);
      
      q=array2.find_first_index with (item>3 & item<6);// doubt
      $display(" value  of first index is:q=%0p",q);
      
      q=array2.find_last_index with  (item>3 & item<6);
      $display("value of last index is:q=%0p",q);
      
      q=array2.unique_index ;
      $display("unique_index is:q=%0p",q);
      
      //array_reduction method
      
      $display("array2 sum =%0d",array2.sum);
      
      $display("array2 product =%0d",array2.product);// it returns the product of all the element the array
      
      $display("array2  AND(&) =%0d",array2.and);//bitwise and
      
      $display("array2  OR(|) =%0d",array2.or);//bitwise or
      
      $display("array2  XOR(^) =%0d",array2.xor);//bitwise xor
      
    end
endmodule

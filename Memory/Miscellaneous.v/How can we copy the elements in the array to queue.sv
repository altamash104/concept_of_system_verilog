/*
How can we copy the elements in the array to queue?
*/

//fixed sized array
module test;
  int arr[5] = '{1, 2, 3, 4, 5}; 
  int queue[$];                  

  initial begin
    // Method 1: Using a loop
    foreach (arr[i])
      queue.push_back(arr[i]);

    // Method 2: Using array concatenation
    // queue = {arr};

    $display("Queue: %p", queue);
  end
endmodule

//dynamic array
module test;
  int dyn_arr[] = new[5]; 
  int queue[$];

  initial begin
    // Initialize dynamic array
    foreach (dyn_arr[i])
      dyn_arr[i] = i + 1;

    // Copy elements
    foreach (dyn_arr[i])
      queue.push_back(dyn_arr[i]);

    $display("Queue: %p", queue);
  end
endmodule


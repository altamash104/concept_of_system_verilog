/*
1.queue is  variable size ordered collection of same data type.
2.Unlike static and dynamic arrays, the size of a queue can change dynamically during runtime as elements are added or removed.
3.Queue provide power full,flexible data structure that operates like a FIFO,LIFO.
4.In dynamic array we allocate the size of memory during the runtime with the help of "new[]" constructor.
means we are allocating the memory and then we are inserting the elements.
5.But in case of queue we don't have to allocate the memory we just insert the element and memory will automatically allocated
means queue can automatically grow and shrink.
*/
module queue;
  int q1[$];//unbounded queue
  int  q2[$];
 
  initial
    begin
      q1={10,30,40,50,60};
      
      $display ("the element of queue:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
      q1.insert(1,20);//queue.insert(index,element);
      
      $display ("the element of queue after insertion:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
      q1.push_front(5);
      $display ("the element of queue after push_front:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
      q1.push_back(5);
      
      $display ("the element of queue after push_back:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
      q1.pop_front();
      
      $display ("the element of queue after pop_front:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
       q1.pop_back();
      
      $display ("the element of queue after pop_front:q1=%0p",q1);
      $display ("the size of queue :q1=%0p",q1.size());
      
      //shuffle method
      
      q1.shuffle();
      $display ("the element of queue after shuffle:q1=%0p",q1);
      
      q1.delete(2);//queue.delete(index no)
      $display ("the element of queue after delete:q1=%0p",q1);
      $display ("the size of queue after delete:q1=%0p",q1.size());
      
    end
endmodule

/////////Bounded queue///////////
module bounded_queue;
  bit[31:0] q[$:3]; //bounded queue
  
  initial
    begin
      q={0,1,2,3};
      
      q.push_front(8);//last element will be pushed out.
      $display ("the element of queue after push_front:q=%0p",q);
      
      q.push_back(8);
      $display ("the element of queue after push_front:q=%0p",q);
      
      foreach(q[i])
        $display("q[%0d]=%0d",i,q[i]);
    end
endmodule

///////////////Queue inside queue//////////////
module test();
  int q1[$]={0,1,5,6,7,8};
  int q2[$]={2,3,4};
  
  initial
    begin
      
      //with method
      foreach(q2[i])
      q1.insert(i+2,q2[i]);
       $display("after inserting the content of %0p",q1);
      $display("content of q2 %0p",q2);
      
     /* //without method
      //foreach (q2[i])
      q1={q1[0:1],q2,q1[2:$]};
      $display("after inserting the content of %0p",q1);
      $display("content of q2 %0p",q2);*/
    end
endmodule

module tb;
  //event ev;
  
  initial
    begin
      fork
        $display("maa ki");
        //$display("Altamash");//inactive-region
        #1 $display("A");//active region
        #2 $display("B");
      join_any
      
      $display("D");
    end
  endmodule
///////////////////////////////////////////////////////
//for_join_none to fork_join_any

module test;
  event ev;
  
  initial
    begin
       fork 
         begin
           #1 $display("A");
           ->ev;
         end
         begin
           #2 $display("B");
           
           ->ev;
         end
       join_none
      
      wait(ev.triggered);
      $display("C");
    end
endmodule
//////////////////////////////////////////////////////       
//fork_join using fork_join_any

module test;
  
  event ev1,ev2,ev3;
  
  initial 
    begin
      fork
        begin:B1
          #1 $display("A");
          ->ev1;
        end
        
        begin:B2
          #2 $display("B");
          ->ev2;
        end
        
        begin:B3
          #3 $display("C");
          ->ev3;
        end
        
      join_any
      
      wait fork;
    
    /*
     wait(ev1.triggered);
      wait(ev2.triggered);
      wait(ev3.triggered);
*/  
       $display("D");
    end

endmodule
          
///////////////////////////////////////////////////////
module test; 
  initial 
    begin
      fork
 
       #2 $display("A");//anyone of the three thread can execute since they are in fork-join_any
        				//but in practical the top written statement will get printed 

          #5 $display("B");

           #1 $display("C");

      join_any

       	  #4 $display("D");
    end

endmodule

/////////////////////////////////////////////////////////
        
module test;

    initial
    begin
        fork
            $display( $time, "A" );
            #1 $display( $time, "B" );
            #0 $display( $time, "C" );
        join_any
        $display( "D" );
    end

endmodule

////////////////////////////////////////////////////////

module top;

    initial
    begin
        fork
          	
            fork
                #4 $display( $time, "A" );
                #0 $display( $time, "B" );
                $display( $time, "C" );
            join_none
            $display( "D" );
        join_any
        $display( "E" );
    end

endmodule

//////////////////////////////////////////////////////
module top;

    initial
    begin
        fork
            fork
                $display( $time, "C" );
            join_none
            $display( "D" );
            disable fork;
        join_any
        $display( "E" );
    end
          
          
endmodule
//////////////////////////////////////////////////////

  module top;

    initial
    begin
        fork
            fork
                begin
                    $display( $time, "0" );
                end
                begin
                    $display( $time, "1" );
                    fork
                        $display( $time, "2" );
                    join_none
                    #0 $display( $time, "3" );
                end
            join_any
            $display( $time, "4" );
        join_any
    end

endmodule
////////////////////////////////////////////////////////////
//fork_join to fork_join_any
module top;

    // NOTE : Ideally its not possible to exactly replicate fork-join_none behaviour using fork-join as in this example you'll see that the other threads are killed, when in fact in fork-join_none, the threads are still active in background.

    initial 
    begin
        fork
            begin : a
                #50;
                $display( $time, "A" );
                disable b;
                disable c;
            end : a
            begin : b
                #100;
                $display( $time, "B" );
                disable a;
                disable c;
            end : b
            begin : c
                #10;
                $display( $time, "C" );
                disable a;
                disable b;
            end : c
        join
        $display( $time, "Final" );
    end

endmodule
////////////////////////////////////////////////////////////

//fork_join_none to fork_join

module top;

    initial 
    begin
        bit [2:0] done; // Use this as a flag. Each bit represents a single thread. Hence, three threads can be started with a 3 bit done falg vector.
        fork
            begin
                #50;
                $display( $time, "A" );
                done[0] = 1;
            end
            begin
                #100;
                $display( $time, "B" );
                done[1] = 1;
            end
            begin
                #10;
                $display( $time, "C" );
                done[2] = 1;
            end
        join_any
        wait(&done); // Only when all flags are high, the wait will allow the execution to proceed ahead.
        $display( $time, "Final" );
    end

endmodule

//////////////////////////////////////////////////////
//fork_join_any to fork_join_none

module top;

    initial 
    begin
        fork
            begin
                #50;
                $display( $time, "A" );
            end
            begin
                #100;
                $display( $time, "B" );
            end
            begin
                #10;
                $display( $time, "C" );
            end
            begin //  Adding an empty begin-end ensure the execution immideatly moves ahead without any time delays
            end
        join_any
        $display( $time, "Final" );
    end

endmodule

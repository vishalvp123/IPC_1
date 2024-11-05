class process;
  task t1;
    #90;
    $display("@%0d TASK 1",$time);
  endtask
  
  task t2;
    #30;
    $display("@%0d TASK 2",$time);
  endtask
  
  task t3;
    #50;
    $display("@%0d TASK 3",$time);
  endtask
  
  task t4;
    #20;
    $display("@%0d TASK 4",$time);
  endtask

endclass

module m1;
  process p1;
  semaphore s;
  
  initial begin
    p1=new();
    s=new();
    fork
      begin
       p1.t1;
       s.put(1);
      end

     begin
       p1.t2;
       s.put(1);
      end
      
      begin
       p1.t3;
       s.put(1);
      end
      
      begin
       p1.t4;
       s.put(1);
      end
      
    join_any
    
    s.get(2);
    
    $display("@%0d OUT OF FORK_JOIN_ANY",$time);
  
  end
endmodule

-----------------------------------------------------------------------------------------------------------
                           V C S   S i m u l a t i o n   R e p o r t 
-----------------------------------------------------------------------------------------------------------
@20 TASK 4
@30 TASK 2
@30 OUT OF FORK_JOIN_ANY
@50 TASK 3
@90 TASK 1
-----------------------------------------------------------------------------------------------------------

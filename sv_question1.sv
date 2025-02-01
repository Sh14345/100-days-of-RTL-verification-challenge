module tb();
  event e1,e2,e3;
  task process_a();
    #10;
    ->e1;
    $display("@%0t:process_A:event e1 is triggered",$time);
  endtask
  
  task process_b();
    #5;
    ->e2;
    $display("@%0t:process_b:event e2 is triggered",$time);
  endtask
  task process_c();
    #12;
    ->e3;
    $display("%0t procces_c:e3 trigg",$time);
  endtask
  
  
  task wait_process();
    $display("%0t:waiting for the event e1,e2,e3",$time);
    wait_order(e1,e3,e2)
    $display("events are triggered in order");
    else
      $display("events are triggered out of order");
  endtask
  
  initial begin
    fork
      process_a();
      process_b();
      process_c();
      wait_process();
    join
  end
endmodule

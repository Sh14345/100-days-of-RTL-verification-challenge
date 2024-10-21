https://www.edaplayground.com/x/uwUG
//Design fibonacci series
module fibonacci(
  input clk,rst,
  output reg [31:0]fib1 =0,
  output reg [31:0] fib2 =1);
  
  always@(posedge clk or posedge rst) begin
    
    if(rst) begin
      fib1<=0;
      fib2<=1;
    end
    else begin
      fib2=fib1+fib2;
      fib1=fib2-fib1;
    end
    
  end
  endmodule




//Testbench

  
 module tb_fibonacci();

  // Testbench signals
  reg clk;
  reg rst;
  wire [31:0] fib1;
  wire [31:0] fib2;

  // Instantiate the Fibonacci module
  fibonacci uut (
    .clk(clk),
    .rst(rst),
    .fib1(fib1),
    .fib2(fib2)
  );

  // Clock generation (50 MHz clock, 20 ns period)
  always begin
    #10 clk = ~clk;  // Toggle clock every 10 ns
  end

  // Test procedure
  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;  // Assert reset

    // Hold reset for a while and release it
    #30 rst = 0;

    // Run the simulation for a few clock cycles
    #200;
    
    // Finish simulation
    $finish;
  end

  // Monitor the values of fib1 and fib2
  initial begin
    $monitor("Time: %0t | fib1 = %d, fib2 = %d", $time, fib1, fib2);
  end

endmodule

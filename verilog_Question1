//Design a combinational circuit to count the number of ones in the hexadecimal no. without using inbuilt function
//using Combinational circuit
module count_ones_combinational(
    input [7:0] hex_num,  // 8-bit input number
    output reg [3:0] one_count // Output is a 4-bit number to store the count
);

integer i;

always @(*) begin
    one_count = 0;  // Initialize the count
    for (i = 0; i < 8; i = i + 1) begin
        one_count = one_count + hex_num[i]; // Add the bit to the count
    end
end

endmodule



//using Sequential circuit
module count_ones_sequential(
    input [7:0] hex_num,   // 8-bit input number
    input clk,             // Clock signal
    input reset,           // Reset signal
    output reg [3:0] one_count // 4-bit count output
);

integer i;
reg [7:0] temp;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        one_count <= 0;  // Reset the count
        temp <= hex_num; // Initialize temp with the input hex number
    end
    else begin
        one_count <= 0;  // Clear the count at the start
        for (i = 0; i < 8; i = i + 1) begin
            one_count <= one_count + temp[i];  // Count ones
        end
    end
end

endmodule







//Testbench example
module tb_count_ones_combinational();

    // Declare inputs as regs and outputs as wires
    reg [7:0] hex_num;
    wire [3:0] one_count;
    
    // Instantiate the module under test (MUT)
    count_ones_combinational uut (
        .hex_num(hex_num),
        .one_count(one_count)
    );
    
    // Initial block to apply stimulus
    initial begin
        // Monitor the changes to hex_num and one_count
        $monitor("At time %0t: hex_num = 0x%h, one_count = %0d", $time, hex_num, one_count);
        
        // Apply test cases
        hex_num = 8'h00; // Expect count = 0
        #10;
        hex_num = 8'hFF; // Expect count = 8
        #10;
        hex_num = 8'h78; // Expect count = 4
        #10;
        hex_num = 8'hF0; // Expect count = 4
        #10;
        hex_num = 8'h0F; // Expect count = 4
        #10;
        hex_num = 8'h55; // Expect count = 4
        #10;
        hex_num = 8'h01; // Expect count = 1
        #10;
        
        // End simulation
        $stop;
    end
    
endmodule

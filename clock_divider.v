    module clk_div_2n(rst, clk, en, div2, div4, div8, div16);
    input rst;
input clk;
    input en;
    output div2;
    output div4;
    output div8;
    output div16;
	 reg [3:0] count=0;
	 
	 always @(posedge clk or posedge rst) begin
	 if(rst)
		count<=0;
	else if (en) begin
		if(count == 4'd15)
		count <=0;
		else
		count <=count + 1;
	end
	end
	assign div2=count[0];
	assign div4=count[1];
	assign div8=count[2];
	assign div16=count[3];


endmodule
//Testbench

module clk_div_2n_tb_v;


initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;
		en = 0;
		
		end

		// Wait 100 ns for global reset to finish
		#10 clk = ~clk;
        
		// Add stimulus here

	
      
endmodule

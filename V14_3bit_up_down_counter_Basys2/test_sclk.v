`timescale 1ns / 1ps

//
//

module test_sclk;

	// Inputs
	reg clk;

	// Outputs
	wire sclk;

	// Instantiate the Unit Under Test (UUT)
	slowClock uut (
		.clk(clk), 
		.sclk(sclk)
	);

	initial 
	begin
	// Initialize Inputs
	clk = 0;
#1000;
$finish;

	end

always #10 clk = ~clk;
      
endmodule


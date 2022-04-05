`timescale 1ns / 1ps

//
//

module test_counter;

	// Inputs
	reg clk;
	reg dir_up;
	reg clear;

	// Outputs
	wire [2:0] count;

	// Instantiate the Unit Under Test (UUT)
	updown_counter uut (
		.clk(clk), 
		.dir_up(dir_up), 
		.clear(clear),
		.count(count)
	);

	initial 
	begin
	// Initialize Inputs
	clear = 1; clk = 0; dir_up = 0;
#100	clear = 0; dir_up = 1;
#200	dir_up = 0;
#200;
	$finish;

	end

always #10 clk = ~clk;
      
endmodule


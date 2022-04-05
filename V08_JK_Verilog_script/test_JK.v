`timescale 1ns / 1ps

//
//

module test_JK;

	// Inputs
	reg J;
	reg K;
	reg clk;
	reg clear;

	// Outputs
	wire Q;
	wire Qbar;

	// Instantiate the Unit Under Test (UUT)
	myJK uut (
		.J(J), 
		.K(K), 
		.clk(clk), 
		.Q(Q), 
		.Qbar(Qbar)
	);

	initial 
	begin
	// Initialize Inputs
	clear = 1; J = 0; K = 0; clk = 0;
#100	clear = 0; J = 0; K = 0;
#100	J = 0; K = 1;
#100	J = 1; K = 0;
#100	J = 1; K = 1;
#200;
	$finish;

	end

always #10 clk = ~clk;
      
endmodule


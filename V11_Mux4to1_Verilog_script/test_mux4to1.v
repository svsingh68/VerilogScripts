`timescale 1ns / 1ps

//
//

module test_mux4to1;

	// Inputs
	reg [3:0] A;
	reg s0;
	reg s1;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	mux4to1 uut (
		.A(A), 
		.s0(s0), 
		.s1(s1), 
		.Q(Q)
	);

	initial 
	begin
	// Initialize Inputs
	A = 4'b0000; s0 = 0; s1 = 0;
#100	A = 4'b0001; s0 = 0; s1 = 0;
#100	A = 4'b0010; s0 = 1; s1 = 0;
#100	A = 4'b0100; s0 = 0; s1 = 1;
#100	A = 4'b1000; s0 = 1; s1 = 1;
#100;
	$finish;

	end
      
endmodule


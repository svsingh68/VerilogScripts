`timescale 1ns / 1ps

//
//

module test_FA;

	// Inputs
	reg A;
	reg B;
	reg C;

	// Outputs
	wire Sum;
	wire Cy;

	// Instantiate the Unit Under Test (UUT)
	FullAdder uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.Sum(Sum), 
		.Cy(Cy)
	);

	initial 
	begin
	// Initialize Inputs
		A = 0; B = 0; C = 0;
	#100; 	A = 0; B = 0; C = 1;
	#100; 	A = 0; B = 1; C = 0;
	#100; 	A = 0; B = 1; C = 1;
	
	#100; 	A = 1; B = 0; C = 0;
	#100; 	A = 1; B = 0; C = 1;
	#100; 	A = 1; B = 1; C = 0;
	#100; 	A = 1; B = 1; C = 1;
	#100; 	
	
	$finish;

	end
      
endmodule


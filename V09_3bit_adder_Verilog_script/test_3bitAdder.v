`timescale 1ns / 1ps

//
//

module test_3bitAdder;

	// Inputs
	reg [2:0] A;
	reg [2:0] B;

	// Outputs
	reg [2:0] sum;
	wire cy;

	// Instantiate the Unit Under Test (UUT)
	Adder3bit uut (
		.A(A), 
		.B(B), 
		.sum(sum), 
		.cy(cy)
	);

	initial 
	begin
	// Initialize Inputs
	A = 3'b000; B = 3'b000;
#100	A = 3'b010; B = 3'b011;

#100	A = 3'b111; B = 3'b100;
#100	A = 3'b111; B = 3'b110;
#100;

$finish;

	end
      
endmodule


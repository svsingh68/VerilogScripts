`timescale 1ns / 1ps

//

module test_maxim;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] C;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	maxim uut (
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.Q(Q)
	);

	initial begin
	// Initialize Inputs
	A = 4'd0;B = 4'd03;C = 4'd0;D = 4'd0;
#100	A = 4'd10;B = 4'd5;C = 4'd02;D = 4'd14;
#100	A = 4'd5;B = 4'd5;C = 4'd5;D = 4'd5;

#100;
$finish;

	end

endmodule

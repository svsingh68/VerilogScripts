`timescale 1ns / 1ps


module mux4to1(A,s0,s1,Q);

input s0, s1;
input [3:0] A;
output reg Q;

always @(A, s0, s1)
	case ({s1,s0})
		2'b00: Q = A[0];
		2'b01: Q = A[1];
		2'b10: Q = A[2];
		2'b11: Q = A[3];
	endcase

endmodule

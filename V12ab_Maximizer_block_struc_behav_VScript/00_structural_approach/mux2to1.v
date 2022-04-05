`timescale 1ns / 1ps
//

module mux2to1(A,B,s,Q);
input s;
input [3:0]A,B;
output [3:0]Q;

assign Q = s ? B : A; // if s=1, Q = B else Q = A;

endmodule

`timescale 1ns / 1ps


module Adder3bit(A, B, sum, cy);
input [2:0] A, B;
output [2:0] sum;
output cy;

wire w1, w2;

FullAdder M1(A[0],B[0],1'b0,sum[0],w1);
FullAdder M2(A[1],B[1],w1,sum[1],w2);
FullAdder M3(A[2],B[2],w2,sum[2],cy);

endmodule

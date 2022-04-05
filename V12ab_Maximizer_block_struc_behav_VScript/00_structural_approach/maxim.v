`timescale 1ns / 1ps
//


module maxim(A,B,C,D,Q);
input [3:0] A,B,C,D;
output [3:0]Q;
wire [3:0]w1,w2;

// mux2to1(A,B,s,Q);

mux2to1 M1(A,B,A<B,w1);
mux2to1 M2(C,D,C<D,w2);
mux2to1 M3(w1,w2,w1<w2,Q);

endmodule

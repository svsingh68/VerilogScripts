`timescale 1ns / 1ps


module FullAdder(A,B,C,Sum,Cy);
input A,B,C;
output Sum, Cy;

// option-1: structural 
// assign Sum = A^B^C;
// assign Cy = (A&B)|(B&C)|(C&A);

//---------------------------------
// option-2: behavioral
 assign {Cy, Sum} = A+B+C;

endmodule

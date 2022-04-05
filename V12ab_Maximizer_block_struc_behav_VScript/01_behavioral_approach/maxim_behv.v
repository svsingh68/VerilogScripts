`timescale 1ns / 1ps
//

module maxim_behv(A,B,C,D,Q);
input [3:0]A,B,C,D;
output reg [3:0]Q;
reg [3:0]temp1,temp2;

always @(*)
	begin
		if (A>B) //=============
		     temp1 = A;
		else temp1 = B;

		if (C>D)  //=============
		     temp2 = C;
		else temp2 = D;

		if (temp1>temp2)  //=======
		     Q = temp1;
		else Q = temp2;

	end


endmodule

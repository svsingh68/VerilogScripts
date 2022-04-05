`timescale 1ns / 1ps


module myJK(J, K, clk, clear, Q, Qbar);

input J,K,clk,clear;
output Q, Qbar;
reg Q;

always @(posedge clk or posedge clear)
	begin
		if(clear==1)
		begin
			Q<= 0;
		end
		else
		begin
		case({J,K})
		2'b00: Q <= Q;  //same
		2'b01: Q <= 0;	// reset
		2'b10: Q <= 1; 	// set
		2'b11: Q <= ~Q; //toggle
		endcase
		end
	end

assign  Qbar = ~Q;

endmodule

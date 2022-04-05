`timescale 1ns / 1ps
//
//
//
module Disp7segCntr(clk,dir_up,clear,AN,CA,sclk);

input clk, clear, dir_up;
output reg[7:0]CA; //msb for dp
output reg[3:0]AN;
output sclk;

reg [2:0] Q;
reg [24:0] counter = 0;  // for slowin clock

assign sclk = counter[24];

always @(posedge clk)
	count <= count + 1;

always @(posedge sclk or posedge clear)
	begin
		if (clear)
			Q <= 0;
		else
			begin
				if (dir_up)
					begin
						Q<= Q + 1;
					end
				else
					begin
						Q <= Q - 1;
					end
			end
	end

always @ (Q)
begin
	AN = 4'b1110;
	CA[7] = 1; //dp led off

	case(Q)

	 			3'b001 : CA[6:0] = 7'b1111001;   // 1
         3'b010 : CA[6:0] = 7'b0100100;   // 2
         3'b011 : CA[6:0] = 7'b0110000;   // 3

         3'b100 : CA[6:0] = 7'b0011001;   // 4
         3'b101 : CA[6:0] = 7'b0010010;   // 5
         3'b110 : CA[6:0] = 7'b0000010;   // 6
         3'b111 : CA[6:0] = 7'b1111000;	  // 7

	 default: CA[6:0] = 7'b1000000;

	endcase
end



endmodule

`timescale 1ns / 1ps


module updown_counter(clk, dir_up, clear, count);

input clk, dir_up, clear;
output reg [2:0] count;

always @(posedge clk or posedge clear)
	begin //-------------------------//-------------------------//-------------------
		if(clear==1)
		begin
			count <= 3'b000;
		end
		else
		begin //------------------
			if(dir_up)
			begin
			 count <= count + 1;
			end
			else
			begin
			 count <= count - 1;
			end
		end //------------------
	end //-------------------------//-------------------------//-------------------
endmodule

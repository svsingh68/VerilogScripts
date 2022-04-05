`timescale 1ns / 1ps


module updown_counter(clk, dir_up, clear, Q, sclk);

input clk, dir_up, clear;
output reg [2:0] Q;
output sclk;

reg [24:0] counter = 0; // for slowin clock

assign sclk = counter[24];

always @(posedge clk)
	counter <= counter + 1;

always @(posedge sclk or posedge clear)
	begin
		if (clear)
		begin
			Q <= 3'b000; 
		end
		else
		begin //------------------
			if(dir_up)
			begin
			 Q <= Q + 1;
			end
			else 
			begin
			 Q <= Q - 1;
			end
		end //------------------
	end
endmodule

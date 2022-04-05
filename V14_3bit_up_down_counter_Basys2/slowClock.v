`timescale 1ns / 1ps


module slowClock(clk,sclk);
input clk;
output sclk;
reg [1:0] counter = 0;

assign sclk = counter[1];

always @(posedge clk)
	counter <= counter + 1;

endmodule

`timescale 1ns / 1ps
//
module disp7seg(clk,D1,D2,D3,D4,AN,CA,sclk);
input clk;
input [3:0]D1,D2,D3,D4;
output reg[3:0]AN;
output reg[7:0]CA;
//==========================
reg [15:0]refDig = 0;
wire refRate;

reg [1:0]digit;
reg [3:0]data;

reg [1:0]countTemp=0;
//==========================
// refresh rate gen //==========================
assign refRate = refDig[15];

always @(posedge clk)
	refDig <= refDig + 1;
//==========================

always @(posedge refRate)
begin  //-------------------------//-------------------------//-------------------
	countTemp <= countTemp + 1;
	if (countTemp == 0)
		begin
		 digit = 2'b00;
		 data = D1;
		end
	else
		begin  //-------------------------//-------------------------
	 	if (countTemp == 1)
	  	begin
 			digit = 1;
			data = D2;
	 	  end
		else
		  begin  //-------------------------
		    if (countTemp == 2)
					begin //-------------
					digit = 2;
					data = D3;
					end  //-------------
	 	    else
			    begin //-------------
			    digit = 3;
			    data = D4;
			    end //-------------
	   	 end//-------------------------
	  end //-------------------------//-------------------------
end //-------------------------//-------------------------//-------------------

//------------------- digit choose anode
//------ data choose cathode

always @(*)
begin
	case(digit)
		0: AN = 4'b1110;
		1: AN = 4'b1101;
		2: AN = 4'b1011;
		3: AN = 4'b0111;
	default : AN = 4'b1111;
	endcase
//-------------------------------
	CA[7] = 1; // dp led off
	case(data)
	4'b0000 : CA[6:0] = 7'b1000000;   // 0
	4'b0001 : CA[6:0] = 7'b1111001;   // 1
	4'b0010 : CA[6:0] = 7'b0100100;   // 2
	4'b0011 : CA[6:0] = 7'b0110000;   // 3
	4'b0100 : CA[6:0] = 7'b0011001;   // 4
	4'b0101 : CA[6:0] = 7'b0010010;   // 5
	4'b0110 : CA[6:0] = 7'b0000010;   // 6
	4'b0111 : CA[6:0] = 7'b1111000;   // 7
	4'b1000 : CA[6:0] = 7'b0000000;   // 8
	4'b1001 : CA[6:0] = 7'b0010000;   // 9
	default : CA[6:0] = 7'b1000000;	  // 0
	endcase
end



endmodule

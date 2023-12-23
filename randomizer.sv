/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		randomizer
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Randomizes number between 1 and 6
*******************************************************************/
module randomizer
	(input logic clk,
	input  logic set,
	input  logic rst,
	output logic[2:0] out);
	
	logic dff1;
	logic dff2;
	logic dff3;
	logic dff4;
	
	//will never give a 0, but will give a 7
	always_ff@(posedge clk, negedge rst) begin
		if(!rst) begin
			dff1 <= 0;
			dff2 <= 1;
			dff3 <= 0;
			dff4 <= 0;
		end else begin
			dff1 <= dff1 ^ dff3;
			dff2 <= dff1;
			dff3 <= dff2;
			dff4 <= dff3;
			if(dff2 == 1 && dff3 == 1 && dff4 == 0) begin //7 will be hit (iterate past it)
				dff1 <= 1;
				dff2 <= 0;
				dff3 <= 1;
				dff4 <= 1;
			end
		end
	end
	always_ff @(negedge set)
		out[2:0] <= {dff4, dff3, dff2};
endmodule	

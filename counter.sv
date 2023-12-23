/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		counter
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		modified counter module that will reset to a
		given value upon `reset_true`
*******************************************************************/
module counter 
	#(parameter N,	// bit size of the output
	  parameter M)	// number to reset to upon `reset_true`
	(input logic clk,
	input  logic reset_true,
	input  logic reset_count,
	output logic[N-1:0] out);
	
	//resets output to 0 upon reset_count
	//resets output to M upon reset_true
	//increments output otherwise
	always_ff @(posedge clk, negedge reset_true, negedge reset_count) begin
		if(!reset_true) out <= M;
		else if (!reset_count) out <= 0;
		else out <= out + 1;
	end
endmodule
	
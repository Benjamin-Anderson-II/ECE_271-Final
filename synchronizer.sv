/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		synchronizer
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Aligns an asynchronous signal to the clock, at
		the expense of 2 clock cycles
*******************************************************************/
module synchronizer
	(input logic clk,
	input  logic d,
	output logic q);
	
	logic n1;
	always_ff @(posedge clk) begin
		n1 <= d;
		q <= n1;
	end
endmodule

/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		comparator
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Simple logic block that outputs true so long as
		the input is less than the M parameter
*******************************************************************/
module comparator
	#(parameter N, // size of the input
	parameter   M) // number being compared to
	(input logic[N-1:0] a,
	output logic a_lt_M);
	
	assign a_lt_M = (a < M);
endmodule

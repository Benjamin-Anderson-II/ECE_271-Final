/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		sevSegLoad
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Seven segment decoder used to determine which 
		stage of animation to display when loading
*******************************************************************/
module sevSegLoad
	(input logic[2:0] num,
	output logic[6:0] display);
	always_comb
		case(num)
			0: 		display<=7'b011_1111;
			1: 		display<=7'b101_1111;
			2: 		display<=7'b110_1111;
			3: 		display<=7'b111_0111;
			4: 		display<=7'b111_1011;
			5: 		display<=7'b111_1101;
			default: display<=7'b111_1110;
		endcase
endmodule

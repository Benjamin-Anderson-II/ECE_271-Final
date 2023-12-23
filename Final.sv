/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		Final
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Top Level for connecting each seven segment 
		display with each switch
*******************************************************************/
module Final
	(input logic clk,
	input  logic rst,
	input  logic set,
	input  logic sw0,
	input  logic sw1,
	input  logic sw2,
	input  logic sw3,
	input  logic sw4,
	input  logic sw5,
	output logic[6:0] sevSeg0,
	output logic[6:0] sevSeg1,
	output logic[6:0] sevSeg2,
	output logic[6:0] sevSeg3,
	output logic[6:0] sevSeg4,
	output logic[6:0] sevSeg5);
	
	whatToDisplay seg0(clk, rst, set, sw0, sevSeg0[6:0]);
	whatToDisplay seg1(clk, rst, set, sw1, sevSeg1[6:0]);
	whatToDisplay seg2(clk, rst, set, sw2, sevSeg2[6:0]);
	whatToDisplay seg3(clk, rst, set, sw3, sevSeg3[6:0]);
	whatToDisplay seg4(clk, rst, set, sw4, sevSeg4[6:0]);
	whatToDisplay seg5(clk, rst, set, sw5, sevSeg5[6:0]);
endmodule

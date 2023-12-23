/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		whatToDisplay
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Module that informs the seven segment display
		what it is supposed to dispay at any given moment.
*******************************************************************/
module whatToDisplay
	(input logic clk,
	input  logic rst,
	input  logic set,
	input  logic switch,
	output logic[6:0] display);
	
	logic[3:0] randNum; 		// The number outputted by the randomizer module
	logic[6:0] rng_display; // The seven segment value of the current random number
	logic[6:0] load_display;// The seven segment value of the loading animation
	logic[3:0] currRand;		// The random number that will be displayed as rng_display
	logic setter;
	
	randomizer randVal(clk, set, rst, randNum[3:0]);	// always randomizing a number (1-6) in the background 
	sevSegHex dis(currRand[3:0], rng_display[6:0]);		// converts curr_rand into a seven segment display
	
	displayLoad load(clk, rst, load_display[6:0]);		// returns a loading animation
	
	// When set and switch are both active, setter turns on. Setter only turns off when rst is active
	always_ff @(negedge set, negedge rst, posedge clk) begin
		if(!set) begin
			if (switch) begin
				currRand[3:0] <= randNum[3:0];
				setter <= 1;
			end
		end else if(!rst) setter <= 0;
	end
	
	//checks to see if setter is active
	//when setter is active, the random number from currRand is displayed
	//when setter is not active, the loading animation is shown to the user.
	always_ff @(negedge rst, posedge setter, posedge clk) begin
		if(setter) begin
			display[6:0] <= rng_display[6:0];
		end else begin
			display[6:0] <= load_display[6:0];
		end
	end

endmodule	

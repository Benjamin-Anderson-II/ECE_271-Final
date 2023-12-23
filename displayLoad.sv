/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		displayLoad
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		Outputs a loading animation
*******************************************************************/
module displayLoad
	(input logic clk,
	input  logic rst,
	output logic[6:0] display);
	
	
	logic[1:0] fast_count; // output of the counter that goes to 25,000,000
	logic[2:0]  count_val;	// informs which stage of the animation is beign displayed
	
	logic clk_short;	// turns high every half second 
	logic count_rst;	// tells the bottom counter when to reset
	logic less_than_6;// outputs HIGH, when bottom counter is less than 6
	logic half_sec;	// the clock used for the animation
	
	//The logical block that counts to a 25,000,000 and resets when it is hit
	counter #(2, 0) fast_counter(clk, rst, half_sec, fast_count[1:0]);
	comparator #(2, 2) fast_comp(fast_count[1:0], clk_short);
	synchronizer fast_sync(clk, clk_short, half_sec);

	//The logical block that counts to 6 and resets when it is hit.
	//(uses the output of the last block as the clock)
	counter #(3, 6) count(half_sec, rst, count_rst, count_val[2:0]);
	comparator #(3, 6) lessThan6(count_val[2:0], less_than_6);
	synchronizer sync(clk, less_than_6, count_rst);
	
	//displays the animation stage dependent on the current count value.
	sevSegLoad segs(count_val[2:0], display[6:0]);
endmodule

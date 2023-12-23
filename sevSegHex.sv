/*******************************************************************
 * Company:				Oregon State University
 * Engineer:			Benjamin Anderson II
 * 
 * Create Date:		11/27/2022
 * Design Name:		Final
 * Module Name:		sevSegHex
 * Project Name:		ECE_272_Final
 * Target Devices:	DE10-Lite
 * Tool Versions:		Quartus Prime 18.0
 * Description:		A standard seven segment display decoder for 
		hexadecimal numbers where the MSB is A, and the LSB is g
*******************************************************************/
module sevSegHex(input  logic[3:0] data,
                output logic[6:0] segments);
  always_comb
    case(data)
      4'h0: 	segments=7'b000_0001;
      4'h1: 	segments=7'b100_1111;
      4'h2: 	segments=7'b001_0010;
      4'h3: 	segments=7'b000_0110;
      4'h4: 	segments=7'b100_1100;
      4'h5: 	segments=7'b010_0100;
      4'h6: 	segments=7'b010_0000;
      4'h7: 	segments=7'b000_1111;
      4'h8: 	segments=7'b000_0000;
      4'h9: 	segments=7'b000_1100;
      
      4'hA: 	segments=7'b000_1000;
      4'hB: 	segments=7'b110_0000;
      4'hC: 	segments=7'b011_0001;
      4'hD: 	segments=7'b100_0010;
      4'hE: 	segments=7'b011_0000;
      4'hF: 	segments=7'b011_1000;
      default: segments=7'b111_1111;
    endcase
endmodule

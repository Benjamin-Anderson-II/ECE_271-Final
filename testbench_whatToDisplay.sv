module testbench_whatToDisplay();
	logic		clk, reset, set, switch;
	logic[6:0]	out;
	logic[6:0]	out_expected;
	logic[31:0]	vectornum, errors;
	logic[1:0]	testvectors[10000:0];

	//instantiate DUT
	whatToDisplay dut(clk, reset, set, switch, out[6:0]);

	//generate clock
	always
		begin
			clk=1; #5; clk=0; #5;
		end

	//at start of test, load vectors and pulse reset
	initial
		begin
			$readmemb("what2dis.tv", testvectors);
			reset = 1; #2; reset = 0; set = 1;
		end

	//apply test vectors on rising edge of clk
	always @(posedge clk)
		begin
			#1; {reset, set, switch, out_expected}=testvectors[vectornum];
		end

	//check results on falling edge of clk
	always @(negedge clk) begin
			if (out!==out_expected) begin // check result
				$display("Error: input$b",{in});
				$display(" output=%b (%b expected)", out, out_expected);
				errors=errors+1;
			end
			vectornum=vectornum+1;
			#25000000
			if(testvectors[vectornum]===2'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
	end
endmodule
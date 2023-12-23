module testbench_synchronizer();
	logic		clk, reset;
	logic		in;
	logic		out;
	logic		out_expected;
	logic[31:0]	vectornum, errors;
	logic[1:0]	testvectors[10000:0];

	//instantiate DUT
	synchronizer dut(in, out);

	//generate clock
	always
		begin
			clk=1; #5; clk=0; #5;
		end

	//at start of test, load vectors and pulse reset
	initial
		begin
			$readmemb("sync.tv", testvectors);
			reset = 1; #2; reset = 0; #2; reset = 1;
		end

	//apply test vectors on rising edge of clk
	always @(posedge clk)
		begin
			#1; {in, out_expected}=testvectors[vectornum];
		end

	//check results on falling edge of clk
	always @(negedge clk) begin
		if(~reset) begin // skip during reset
			if (out!==out_expected) begin // check result
				$display("Error: input$b",{in});
				$display(" output=%b (%b expected)", out, out_expected);
				errors=errors+1;
			end
			vectornum=vectornum+1;
			if(testvectors[vectornum]===2'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
		end
	end
endmodule
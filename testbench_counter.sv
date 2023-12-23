module testbench_counter();
	logic		clk, reset_true, reset_count;
	logic[3:0]	out;
	
	//instantiate DUT
	counter #(4, 5) dut(clk, reset_true, reset_count, out[3:0]);
endmodule
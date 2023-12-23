module testbench_comparator();
	logic[3:0]	in;
	logic		out;
	comparator #(4, 10) dut(in[3:0], out); //compare against 10
endmodule
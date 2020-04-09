module float_add(
	input wire clk,
	input wire [31:0] v1,
	input wire [31:0] v2,

	output wire [31:0] res
);

	wire [7:0] exp1 = v1[30:23];
	wire [7:0] exp2 = v2[30:23];

	wire [22:0] fra1 = v1[22:0];
	wire [22:0] fra2 = v2[22:0];

	assign res = 32'h0;

endmodule

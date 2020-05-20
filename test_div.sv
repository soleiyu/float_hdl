module test_div(
	input wire clk,
	input wire [7:0] v1,
	input wire [7:0] v2
);

	reg [15:0] res;
	wire [7:0] resa = res[15:8];
	wire [7:0] resb = res[7:0];


	always @(posedge clk) begin
		res <= {v1, 8'b0} / v2;
	end

endmodule

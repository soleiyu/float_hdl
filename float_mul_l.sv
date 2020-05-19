module float_mul(
	input wire clk,
	input wire [31:0] v1,
	input wire [31:0] v2,

	output wire [31:0] vres
);

	assign vres = res;

	// TIM1
	reg [7:0] v1e;
	reg [7:0] v2e;
	reg [23:0] v1v;
	reg [23:0] v2v;
	reg v1o;
	reg v2o;

	// TIM2
	reg [7:0] re;
	reg [47:0] rv;
	reg ro;

	// TIM3
	reg [31:0] res;

	always @(posedge clk) begin
	// TIM1
		v1e <= (v1[30:23] - 8'h7F);
		v2e <= (v2[30:23] - 8'h7F);
		v1v <= {1'b1, v1[22:0]};
		v2v <= {1'b1, v2[22:0]};
		v1o <= v1[31];
		v2o <= v2[31];

	// TIM2
		re <= v1e + v2e;
		rv <= v1v * v2v;
		ro <= v1o ^ v2o;

	// TIM3
		if (rv[47]) begin
			res <= {ro, re + 8'h80, rv[46:24] + {22'b0, rv[23]}};
		end else begin
			res <= {ro, re + 8'h7F, rv[45:23] + {22'b0, rv[22]}};
		end
	end

endmodule

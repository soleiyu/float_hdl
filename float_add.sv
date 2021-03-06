module float_add(
	input wire clk,
	input wire [31:0] v1,
	input wire [31:0] v2,

	output wire [31:0] vres
);

	assign vres = res;

	//TIM1
	reg [31:0] vb;
	reg [31:0] vs;
	reg [24:0] r1;

	//TIM2
	reg [7:0] dexp;
	reg [7:0] vexp;
	reg [22:0] vb2;
	reg [22:0] vs2;
	
	//TIM3
	reg [7:0] vexp2;
	reg [24:0] vb3;
	reg [24:0] vs3;
	
	//TIM4
	reg [7:0] vexp3;
	reg [24:0] r;

	//TIM5
	reg [31:0] res;

	always @(posedge clk) begin
		
		// TIM1 //
		if (v2[30:23] < v1[30:23]) begin
			vb <= v1;
			vs <= v2;
		end else begin
			vb <= v2;
			vs <= v1;
		end

		// TIM2 //
		dexp <= vb[30:23] - vs[30:23];
		vexp <= vb[30:23];

		vb2 <= vb;
		vs2 <= vs;

		// TIM3 //
		vexp2 <= vexp;
		
		vb3 <= {2'b1, vb2};
		vs3 <= {1'b0, vssf({1'b1, vs2}, dexp)};

		// TIM4 //
		vexp3 <= vexp2;

		r <= vb3 + vs3;

		// TIM5 //
		res[31] <= 1'b0;

		if (r[24]) begin
			res[30:23] <= vexp3 + 8'b1;
			res[22:0] <= r[23:1];
		end else begin
			res[30:23] <= vexp3;
			res[22:0] <= r[22:0];
		end
	end

//Value Small Shift Function
function [23:0] vssf(input [23:0] v, input [7:0] num);
begin
  case(num)
  8'd0: vssf = v;
  8'd1: vssf = {1'b0, v[23:1]};
  8'd2: vssf = {2'b0, v[23:2]};
  8'd3: vssf = {3'b0, v[23:3]};
  8'd4: vssf = {4'b0, v[23:4]};

  8'd5: vssf = {5'b0, v[23:5]};
  8'd6: vssf = {6'b0, v[23:6]};
  8'd7: vssf = {7'b0, v[23:7]};
  8'd8: vssf = {8'b0, v[23:8]};
  8'd9: vssf = {9'b0, v[23:9]};

  8'd10: vssf = {10'b0, v[23:10]};
  8'd11: vssf = {11'b0, v[23:11]};
  8'd12: vssf = {12'b0, v[23:12]};
  8'd13: vssf = {13'b0, v[23:13]};
  8'd14: vssf = {14'b0, v[23:14]};

  8'd15: vssf = {15'b0, v[23:15]};
  8'd16: vssf = {16'b0, v[23:16]};
  8'd17: vssf = {17'b0, v[23:17]};
  8'd18: vssf = {18'b0, v[23:18]};
  8'd19: vssf = {19'b0, v[23:19]};

  8'd20: vssf = {20'b0, v[23:20]};
  8'd21: vssf = {21'b0, v[23:21]};
  8'd22: vssf = {22'b0, v[23:22]};
  8'd23: vssf = {23'b0, v[23]};
  default: vssf = 24'b0;
  endcase
end
endfunction

endmodule

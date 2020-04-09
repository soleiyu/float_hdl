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

	reg [31:0] vb;
	reg [31:0] vs;
	reg [24:0] vb2;
	reg [24:0] vs2;
	reg [24:0] r1;

	reg [7:0] dexp;

	always @(posedge clk) begin
		if (exp2 < exp1) begin
			vb <= v1;
			vs <= v2;
		end else if (exp1 < exp2) begin
			vb <= v2;
			vs <= v1;
		end else begin
			if (fra2 < fra1) begin
				vb <= v1;
				vs <= v2;
			end else begin
				vb <= v2;
				vs <= v1;
			end
		end

		dexp <= vb[30:23] - vs[30:23];

		vb2 <= {2'b10, vb[22:0]};
		vs2 <= {1'b0, vssf({1'b1, vs[22:0]}, dexp)};

		r1 <= vb2 + vs2;
		

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

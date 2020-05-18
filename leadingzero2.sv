module lzsv(
	input wire clk,
	input wire [24:0] v,

	output wire [7:0] num,
	output wire [23:0] res
);

// {num8, res24}
 reg [31:0] cnum;
 assign num = cnum[31:24];
 assign res = cnum[23:0];

always @(posedge clk) begin
	if (v[24]) cnum <= {8'hFF, v[24:1]};
	else if (v[23]) cnum <= {8'd0, v[23:0]};
	else if (v[22]) cnum <= {8'd1, v[22:0],  1'b0};
	else if (v[21]) cnum <= {8'd2, v[21:0],  2'b0};
	else if (v[20]) cnum <= {8'd3, v[20:0],  3'b0};
	else if (v[19]) cnum <= {8'd4, v[19:0],  4'b0};
	else if (v[18]) cnum <= {8'd5, v[18:0],  5'b0};
	else if (v[17]) cnum <= {8'd6, v[17:0],  6'b0};
	else if (v[16]) cnum <= {8'd7, v[16:0],  7'b0};
	else if (v[15]) cnum <= {8'd8, v[15:0],  8'b0};
	else if (v[14]) cnum <= {8'd9, v[14:0],  9'b0};
	else if (v[13]) cnum <= {8'd10, v[13:0], 10'b0};
	else if (v[12]) cnum <= {8'd11, v[12:0], 11'b0};
	else if (v[11]) cnum <= {8'd12, v[11:0], 12'b0};
	else if (v[10]) cnum <= {8'd13, v[10:0], 13'b0};
	else if (v[ 9]) cnum <= {8'd14, v[ 9:0], 14'b0};
	else if (v[ 8]) cnum <= {8'd15, v[ 8:0], 15'b0};
	else if (v[ 7]) cnum <= {8'd16, v[ 7:0], 16'b0};
	else if (v[ 6]) cnum <= {8'd17, v[ 6:0], 17'b0};
	else if (v[ 5]) cnum <= {8'd18, v[ 5:0], 18'b0};
	else if (v[ 4]) cnum <= {8'd19, v[ 4:0], 19'b0};
	else if (v[ 3]) cnum <= {8'd20, v[ 3:0], 20'b0};
	else if (v[ 2]) cnum <= {8'd21, v[ 2:0], 21'b0};
	else if (v[ 1]) cnum <= {8'd22, v[ 1:0], 22'b0};
	else if (v[ 0]) cnum <= {8'd23, 24'h800_000};
	else cnum <= {8'd0, 24'd0};
end

endmodule

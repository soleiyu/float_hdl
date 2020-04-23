module lz(
	input wire clk,
	input wire [23:0] v,

	output wire [4:0] num
);

 reg [4:0] cnum;
 assign num = cnum;

always @(posedge clk) begin
	if (v[23]) cnum <= 5'd0;
	else if (v[22]) cnum <= 5'd1;
	else if (v[21]) cnum <= 5'd2;
	else if (v[20]) cnum <= 5'd3;
	else if (v[19]) cnum <= 5'd4;
	else if (v[18]) cnum <= 5'd5;
	else if (v[17]) cnum <= 5'd6;
	else if (v[16]) cnum <= 5'd7;
	else if (v[15]) cnum <= 5'd8;
	else if (v[14]) cnum <= 5'd9;
	else if (v[13]) cnum <= 5'd10;
	else if (v[12]) cnum <= 5'd11;
	else if (v[11]) cnum <= 5'd12;
	else if (v[10]) cnum <= 5'd13;
	else if (v[ 9]) cnum <= 5'd14;
	else if (v[ 8]) cnum <= 5'd15;
	else if (v[ 7]) cnum <= 5'd16;
	else if (v[ 6]) cnum <= 5'd17;
	else if (v[ 5]) cnum <= 5'd18;
	else if (v[ 4]) cnum <= 5'd19;
	else if (v[ 3]) cnum <= 5'd20;
	else if (v[ 2]) cnum <= 5'd21;
	else if (v[ 1]) cnum <= 5'd22;
	else if (v[ 0]) cnum <= 5'd23;
	else cnum <= 5'd31;
end

endmodule

module lzv(
	input wire clk,
	input wire [23:0] v,

	output wire [23:0] res
);

 reg [23:0] cnum;
 assign res = cnum;

always @(posedge clk) begin
	if (v[23]) cnum <= v;
	else if (v[22]) cnum <= {v[22:0],  1'b0};
	else if (v[21]) cnum <= {v[21:0],  2'b0};
	else if (v[20]) cnum <= {v[20:0],  3'b0};
	else if (v[19]) cnum <= {v[19:0],  4'b0};
	else if (v[18]) cnum <= {v[18:0],  5'b0};
	else if (v[17]) cnum <= {v[17:0],  6'b0};
	else if (v[16]) cnum <= {v[16:0],  7'b0};
	else if (v[15]) cnum <= {v[15:0],  8'b0};
	else if (v[14]) cnum <= {v[14:0],  9'b0};
	else if (v[13]) cnum <= {v[13:0], 10'b0};
	else if (v[12]) cnum <= {v[12:0], 11'b0};
	else if (v[11]) cnum <= {v[11:0], 12'b0};
	else if (v[10]) cnum <= {v[10:0], 13'b0};
	else if (v[ 9]) cnum <= {v[ 9:0], 14'b0};
	else if (v[ 8]) cnum <= {v[ 8:0], 15'b0};
	else if (v[ 7]) cnum <= {v[ 7:0], 16'b0};
	else if (v[ 6]) cnum <= {v[ 6:0], 17'b0};
	else if (v[ 5]) cnum <= {v[ 5:0], 18'b0};
	else if (v[ 4]) cnum <= {v[ 4:0], 19'b0};
	else if (v[ 3]) cnum <= {v[ 3:0], 20'b0};
	else if (v[ 2]) cnum <= {v[ 2:0], 21'b0};
	else if (v[ 1]) cnum <= {v[ 1:0], 22'b0};
	else cnum <=24'h800_000;
end

endmodule

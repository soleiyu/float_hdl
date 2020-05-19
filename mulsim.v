`timescale 1ps/1ps
module mulsim();

  reg clk;
  wire [31:0] res;
//  wire [31:0] v2 = 32'h42F6_CCCD; //123.4
	wire [31:0] v2 = 32'h3AA_137F4; //0.00123
//	wire [31:0] v1 = 32'h40E8_0000; //7.25
	wire [31:0] v1 = 32'h3F39_999A; //0.725

	float_mul fmul(
		.clk(clk),
		.v1(v1),
		.v2(v2),
		.vres(res)
	);

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

 integer i;  
  initial begin
    $dumpfile("mulsim.vcd");
    $dumpvars(0, mulsim);
    $monitor ("%t: clk = %b res = %h", $time, clk, res);
  end

  initial begin
    #20 $finish();
  end

endmodule

`timescale 1ps/1ps
module subsim();

  reg clk;
  wire [31:0] res;
  wire [31:0] v1 = 32'h42F6_CCCD; //123.4
  wire [31:0] v2 = 32'h40E8_0000; //7.25

	float_sub fs(
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
    $dumpfile("subsim.vcd");
    $dumpvars(0, subsim);
    $monitor ("%t: clk = %b", $time, clk);
  end

  initial begin
    #20 $finish();
  end

endmodule

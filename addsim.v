`timescale 1ps/1ps
module addsim();

  reg clk;
  wire [31:0] res;
  wire [31:0] v1 = 32'h42F6_CCCD; //123.4
  wire [31:0] v2 = 32'h40E8_0000; //7.25

	float_add fa(
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
    $dumpfile("addsim.vcd");
    $dumpvars(0, addsim);
    $monitor ("%t: clk = %b", $time, clk);
  end

  initial begin
    #20 $finish();
  end

endmodule

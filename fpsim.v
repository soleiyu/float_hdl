`timescale 1ps/1ps
module fpsim();

  reg clk;
  wire [31:0] res;
  wire [31:0] v1 = 32'h4145_851F;
  wire [31:0] v2 = 32'h4049_0FDA;

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
    $dumpfile("fpsim.vcd");
    $dumpvars(0, fpsim);
    $monitor ("%t: clk = %b", $time, clk);
  end

  initial begin
    #10 $finish();
  end

endmodule

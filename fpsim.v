`timescale 1ps/1ps
module fpu_sim();

  reg clk;
  wire [31:0] res;
  reg [3:0] acnt;

	always @(posedge clk) begin
		acnt <= acnt + 4'b1;
	end

	float_add fa(
		.clk(clk),
		.v1(32'hFFFF_FFFF),
		.v2(32'hFFFF_FFFF),
		.res(res)
	);

  initial begin
    clk = 0;
		acnt <= 4'b0;
    forever #10 clk = ~clk;
  end

 integer i;  
  initial begin
    $dumpfile("fpus.vcd");
    $dumpvars(0, fpu_sim);
//    for(i = 0;i < 2**FIFO_DEPTH;i++)
//      $dumpvars(1,u0.data[i]);
    $monitor ("%t: clk = %b", $time, clk);
  end

  initial begin
    #500 $finish();
  end

endmodule

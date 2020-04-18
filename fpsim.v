`timescale 1ps/1ps
module fpu_sim();

  reg clk;
  wire [31:0] res;
  reg [7:0] acnt;

	always @(posedge clk) begin
		acnt <= acnt + 8'b1;
	end

	float_add fa(
		.clk(clk),
		.v1({1'b0, acnt, 23'h00_1234}),
		.v2({1'b0, 8'd127, 23'h00_1000}),
		.vres(res)
	);

  initial begin
    clk = 0;
		acnt <= 8'b0;
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
    #5000 $finish();
  end

endmodule

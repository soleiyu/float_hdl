`timescale 1ps/1ps
module aszsim();

  reg clk;
  wire [31:0] res;
//  wire [31:0] v1 = 32'h42F6_CCCD; //123.4
//  wire [31:0] v2 = 32'h42F6_CCCD; //123.4
  wire [31:0] v1 = 32'h0000_0000; //0
  wire [31:0] v2 = 32'h0000_0000; //0
//	wire [31:0] v2 = 32'hC0E8_0000; //7.25
  wire op = 0;

	float_addsub fas(
		.clk(clk),
		.v1(v1),
		.v2(v2),
		.op(op),
		.vres(res)
	);

  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

 integer i;  
  initial begin
    $dumpfile("aszsim.vcd");
    $dumpvars(0, aszsim);
    $monitor ("%t: clk = %b res = %h", $time, clk, res);
  end

  initial begin
    #20 $finish();
  end

endmodule

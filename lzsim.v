`timescale 1ps/1ps
module lzsim();

  reg clk;
  wire[23:0] res;
  wire[ 4:0] num;
  reg [23:0] acnt;

	always @(posedge clk) begin
		acnt <= acnt + 24'b1;
	end

	lzsv lzm(
		.clk(clk),
		.v(acnt),
		.num(num),
		.res(res)
	);

  initial begin
    clk = 0;
		acnt <= 8'b0;
    forever #10 clk = ~clk;
  end

 integer i;  
  initial begin
    $dumpfile("lzsim.vcd");
    $dumpvars(0, lzsim);
//    for(i = 0;i < 2**FIFO_DEPTH;i++)
//      $dumpvars(1,u0.data[i]);
    $monitor ("%t: clk = %b", $time, clk);
  end

  initial begin
    #5000 $finish();
  end

endmodule

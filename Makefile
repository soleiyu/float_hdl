default:
	iverilog -o res.out float_add.sv fpsim.v
	./res.out
view:
	gtkwave fpsim.vcd 

lzsim: 
	iverilog -o res.out leadingzero.sv lzsim.v
	./res.out
	gtkwave lzsim.vcd 

subsim: 
	iverilog -o res.out float_sub.sv leadingzero.sv subsim.v
	./res.out
	gtkwave subsim.vcd 

addsim: 
	iverilog -o res.out float_add2.sv leadingzero2.sv addsim.v
	./res.out
	gtkwave addsim.vcd 


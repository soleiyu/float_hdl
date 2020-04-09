default:
	iverilog -o res.out float_add.sv fpsim.v
	./res.out
view:
	gtkwave fpus.vcd 

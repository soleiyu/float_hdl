default:
	iverilog -o res.out float.sv fpsim.v
	./res.out
view:
	gtkwave fpus.vcd 

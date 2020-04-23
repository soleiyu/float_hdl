default:
	iverilog -o res.out float_add.sv fpsim.v
	./res.out
view:
	gtkwave fpus.vcd 

lzsim: 
	iverilog -o res.out leadingzero.sv lzsim.v
	./res.out
	gtkwave lzsim.vcd 


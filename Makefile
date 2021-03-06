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

assim: 
	iverilog -o res.out float_addsub.sv leadingzero2.sv assim.v
	./res.out

#5/18
aszsim: 
	iverilog -o res.out float_asz.sv leadingzero2.sv aszsim.v
	./res.out
#	gtkwave assim.vcd 

mulsim: 
	iverilog -o res.out float_mul.sv mulsim.v
	./res.out
#	gtkwave mulsim.vcd 

# 5/20 DIV
divsim: 
	iverilog -o res.out float_div.sv divsim.v
	./res.out
#	gtkwave divsim.vcd 


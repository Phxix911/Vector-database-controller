######################################################################
#
# File name : toplevel_tb_simulate.do
# Created on: Tue Aug 15 20:42:40 +0100 2023
#
# Auto generated by Vivado for 'post-synthesis' simulation
#
######################################################################
vsim -voptargs="+acc" +transport_int_delays +pulse_e/0 +pulse_int_e/0 +pulse_r/0 +pulse_int_r/0 -L xil_defaultlib -L simprims_ver -L secureip -lib xil_defaultlib xil_defaultlib.toplevel_tb xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {toplevel_tb_wave.do}

view wave
view structure
view signals

do {toplevel_tb.udo}

run 1000ns

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -childformat {{{/Ram_tb/ram/Mem[16]} -radix hexadecimal} {{/Ram_tb/ram/Mem[15]} -radix hexadecimal} {{/Ram_tb/ram/Mem[14]} -radix hexadecimal} {{/Ram_tb/ram/Mem[13]} -radix hexadecimal} {{/Ram_tb/ram/Mem[12]} -radix hexadecimal} {{/Ram_tb/ram/Mem[11]} -radix hexadecimal} {{/Ram_tb/ram/Mem[10]} -radix hexadecimal} {{/Ram_tb/ram/Mem[9]} -radix hexadecimal} {{/Ram_tb/ram/Mem[8]} -radix hexadecimal} {{/Ram_tb/ram/Mem[7]} -radix hexadecimal} {{/Ram_tb/ram/Mem[6]} -radix hexadecimal} {{/Ram_tb/ram/Mem[5]} -radix hexadecimal} {{/Ram_tb/ram/Mem[4]} -radix hexadecimal} {{/Ram_tb/ram/Mem[3]} -radix hexadecimal} {{/Ram_tb/ram/Mem[2]} -radix hexadecimal} {{/Ram_tb/ram/Mem[1]} -radix hexadecimal} {{/Ram_tb/ram/Mem[0]} -radix hexadecimal}} -expand -subitemconfig {{/Ram_tb/ram/Mem[16]} {-radix hexadecimal} {/Ram_tb/ram/Mem[15]} {-radix hexadecimal} {/Ram_tb/ram/Mem[14]} {-radix hexadecimal} {/Ram_tb/ram/Mem[13]} {-radix hexadecimal} {/Ram_tb/ram/Mem[12]} {-radix hexadecimal} {/Ram_tb/ram/Mem[11]} {-radix hexadecimal} {/Ram_tb/ram/Mem[10]} {-radix hexadecimal} {/Ram_tb/ram/Mem[9]} {-radix hexadecimal} {/Ram_tb/ram/Mem[8]} {-radix hexadecimal} {/Ram_tb/ram/Mem[7]} {-radix hexadecimal} {/Ram_tb/ram/Mem[6]} {-radix hexadecimal} {/Ram_tb/ram/Mem[5]} {-radix hexadecimal} {/Ram_tb/ram/Mem[4]} {-radix hexadecimal} {/Ram_tb/ram/Mem[3]} {-radix hexadecimal} {/Ram_tb/ram/Mem[2]} {-radix hexadecimal} {/Ram_tb/ram/Mem[1]} {-radix hexadecimal} {/Ram_tb/ram/Mem[0]} {-radix hexadecimal}} /Ram_tb/ram/Mem
add wave -noupdate /Ram_tb/clk
add wave -noupdate /Ram_tb/BUS_WE
add wave -noupdate -radix hexadecimal /Ram_tb/BUS_DATA
add wave -noupdate -radix hexadecimal /Ram_tb/BUS_ADDR
add wave -noupdate -radix hexadecimal /Ram_tb/data_in
add wave -noupdate /Ram_tb/data_out
add wave -noupdate /glbl/GSR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {48450 ps} {112450 ps}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -childformat {{{/fifo_tb/long_fifo/memory[2]} -radix hexadecimal} {{/fifo_tb/long_fifo/memory[1]} -radix hexadecimal} {{/fifo_tb/long_fifo/memory[0]} -radix hexadecimal}} -expand -subitemconfig {{/fifo_tb/long_fifo/memory[2]} {-radix hexadecimal} {/fifo_tb/long_fifo/memory[1]} {-radix hexadecimal} {/fifo_tb/long_fifo/memory[0]} {-height 15 -radix hexadecimal}} /fifo_tb/long_fifo/memory
add wave -noupdate /fifo_tb/clk
add wave -noupdate /fifo_tb/rst_n
add wave -noupdate /fifo_tb/write_enable
add wave -noupdate /fifo_tb/read_enable
add wave -noupdate /fifo_tb/shift
add wave -noupdate /fifo_tb/mode
add wave -noupdate /fifo_tb/valid
add wave -noupdate /fifo_tb/empty
add wave -noupdate /fifo_tb/full
add wave -noupdate -radix hexadecimal /fifo_tb/data_in
add wave -noupdate -radix hexadecimal /fifo_tb/data_out
add wave -noupdate -radix hexadecimal /fifo_tb/BUS_ADDR
add wave -noupdate /glbl/GSR
add wave -noupdate /fifo_tb/long_fifo/write_pointer
add wave -noupdate /fifo_tb/long_fifo/read_pointer
add wave -noupdate /fifo_tb/long_fifo/next_write_pointer
add wave -noupdate /fifo_tb/long_fifo/next_read_pointer
add wave -noupdate /fifo_tb/long_fifo/write_lpointer
add wave -noupdate /fifo_tb/long_fifo/read_lpointer
add wave -noupdate /fifo_tb/long_fifo/next_write_lpointer
add wave -noupdate /fifo_tb/long_fifo/next_read_lpointer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95120 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
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
WaveRestoreZoom {16128 ps} {255999 ps}

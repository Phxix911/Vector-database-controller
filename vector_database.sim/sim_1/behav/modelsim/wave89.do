onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /toplevel_tb/clk
add wave -noupdate /toplevel_tb/reset
add wave -noupdate /toplevel_tb/l1
add wave -noupdate /toplevel_tb/l2
add wave -noupdate /toplevel_tb/din
add wave -noupdate /toplevel_tb/error
add wave -noupdate /toplevel_tb/dout
add wave -noupdate /toplevel_tb/ready
add wave -noupdate /toplevel_tb/req1
add wave -noupdate /toplevel_tb/req2
add wave -noupdate /toplevel_tb/data_in
add wave -noupdate /toplevel_tb/bus_interrupts_raise
add wave -noupdate /toplevel_tb/bus_interrupts_ack
add wave -noupdate /toplevel_tb/write
add wave -noupdate /toplevel_tb/instruction_addr
add wave -noupdate -radix hexadecimal /toplevel_tb/instruction
add wave -noupdate /glbl/GSR
add wave -noupdate /toplevel_tb/top/p/temp_reg1
add wave -noupdate /toplevel_tb/top/p/temp_reg2
add wave -noupdate /toplevel_tb/top/p/temp_reg3
add wave -noupdate /toplevel_tb/top/p/temp_reg4
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/bus_data
add wave -noupdate /toplevel_tb/top/p/bus_addr
add wave -noupdate /toplevel_tb/top/p/rom_address
add wave -noupdate /toplevel_tb/top/p/rom_data
add wave -noupdate /toplevel_tb/top/p/bus_interrupts_raise
add wave -noupdate /toplevel_tb/top/p/bus_interrupts_ack
add wave -noupdate /toplevel_tb/top/p/shift
add wave -noupdate /toplevel_tb/top/p/mode
add wave -noupdate /toplevel_tb/top/p/busdatain
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/bus_data
add wave -noupdate -height 20 -radix hexadecimal /toplevel_tb/top/p/CurrBusDataOut
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/NextBusDataOut
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/CurrBusAddr
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/NextBusAddr
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/CurrRegA
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/CurrRegB
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/temporeg
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/CurrState
add wave -noupdate -radix hexadecimal /toplevel_tb/top/p/NextState
add wave -noupdate -childformat {{{/toplevel_tb/top/stack1/memory[7]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[6]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[5]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[4]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[3]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[2]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[1]} -radix hexadecimal} {{/toplevel_tb/top/stack1/memory[0]} -radix hexadecimal}} -subitemconfig {{/toplevel_tb/top/stack1/memory[7]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[6]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[5]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[4]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[3]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[2]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[1]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack1/memory[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/stack1/memory
add wave -noupdate /toplevel_tb/top/stack1/slow_pointer
add wave -noupdate /toplevel_tb/top/stack1/fast_pointer
add wave -noupdate -childformat {{{/toplevel_tb/top/stack2/memory[7]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[6]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[5]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[4]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[3]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[2]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[1]} -radix hexadecimal} {{/toplevel_tb/top/stack2/memory[0]} -radix hexadecimal}} -subitemconfig {{/toplevel_tb/top/stack2/memory[7]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[6]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[5]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[4]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[3]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[2]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[1]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack2/memory[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/stack2/memory
add wave -noupdate /toplevel_tb/top/stack2/fast_pointer
add wave -noupdate /toplevel_tb/top/stack2/slow_pointer
add wave -noupdate -childformat {{{/toplevel_tb/top/stack3/memory[1]} -radix hexadecimal} {{/toplevel_tb/top/stack3/memory[0]} -radix hexadecimal}} -expand -subitemconfig {{/toplevel_tb/top/stack3/memory[1]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/stack3/memory[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/stack3/memory
add wave -noupdate /toplevel_tb/top/stack3/fast_pointer
add wave -noupdate /toplevel_tb/top/stack3/slow_pointer
add wave -noupdate -childformat {{{/toplevel_tb/top/fifo_out/memory[0]} -radix hexadecimal}} -subitemconfig {{/toplevel_tb/top/fifo_out/memory[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/fifo_out/memory
add wave -noupdate /toplevel_tb/top/fifo_out/valid
add wave -noupdate -childformat {{{/toplevel_tb/top/ram/Mem[15]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[14]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[13]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[12]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[11]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[10]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[9]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[8]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[7]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[6]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[5]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[4]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[3]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[2]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[1]} -radix hexadecimal} {{/toplevel_tb/top/ram/Mem[0]} -radix hexadecimal}} -subitemconfig {{/toplevel_tb/top/ram/Mem[15]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[14]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[13]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[12]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[11]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[10]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[9]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[8]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[7]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[6]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[5]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[4]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[3]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[2]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[1]} {-height 15 -radix hexadecimal} {/toplevel_tb/top/ram/Mem[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/ram/Mem
add wave -noupdate -radix hexadecimal /toplevel_tb/top/uart2/readable
add wave -noupdate /toplevel_tb/uart1/req
add wave -noupdate -radix hexadecimal /toplevel_tb/uart1/din
add wave -noupdate /toplevel_tb/uart1/tx
add wave -noupdate -radix unsigned /toplevel_tb/uart1/uart_tx/cnt
add wave -noupdate -radix hexadecimal /toplevel_tb/uart1/uart_tx/din_reg
add wave -noupdate /toplevel_tb/uart1/uart_tx/cstate
add wave -noupdate -radix hexadecimal /toplevel_tb/uart1/uart_tx/din_total
add wave -noupdate /toplevel_tb/uart1/uart_tx/number
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/dout
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/flag
add wave -noupdate /toplevel_tb/uart1/uart_rx/cnt_d
add wave -noupdate -radix hexadecimal /toplevel_tb/top/uart2/din
add wave -noupdate -radix unsigned /toplevel_tb/top/uart2/uart_rx/cnt_initial
add wave -noupdate -radix unsigned /toplevel_tb/top/uart2/uart_rx/cnt
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/number
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/down
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/dout_reg
add wave -noupdate /toplevel_tb/top/uart2/uart_rx/dout_total
add wave -noupdate /toplevel_tb/top/uart2/ready
add wave -noupdate -childformat {{{/toplevel_tb/top/uart_input/memory[0]} -radix hexadecimal}} -subitemconfig {{/toplevel_tb/top/uart_input/memory[0]} {-height 15 -radix hexadecimal}} /toplevel_tb/top/uart_input/memory
add wave -noupdate /toplevel_tb/top/uart_input/data_in
add wave -noupdate -radix hexadecimal /toplevel_tb/top/uart2/uart_tx/din_total
add wave -noupdate -radix unsigned /toplevel_tb/top/uart2/uart_tx/cnt
add wave -noupdate -radix hexadecimal /toplevel_tb/top/uart2/uart_tx/din_reg
add wave -noupdate /toplevel_tb/top/uart2/uart_tx/cstate
add wave -noupdate /toplevel_tb/top/uart2/uart_tx/number
add wave -noupdate /toplevel_tb/top/uart2/uart_tx/flag
add wave -noupdate /toplevel_tb/top/uart2/uart_tx/tx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {480000 ps} 0} {{Cursor 2} {31765572336 ps} 0} {{Cursor 3} {39583230000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 266
configure wave -valuecolwidth 98
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
WaveRestoreZoom {0 ps} {1390304 ps}

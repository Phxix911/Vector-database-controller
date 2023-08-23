onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /uart_tx_tb/clk
add wave -noupdate /uart_tx_tb/rst
add wave -noupdate -radix hexadecimal /uart_tx_tb/din
add wave -noupdate /uart_tx_tb/req
add wave -noupdate /uart_tx_tb/tx
add wave -noupdate /uart_tx_tb/uart_tx/cstate
add wave -noupdate /uart_tx_tb/readable
add wave -noupdate /uart_tx_tb/valid
add wave -noupdate -radix hexadecimal /uart_tx_tb/uart_tx/din_total
add wave -noupdate /uart_tx_tb/uart_tx/din_reg
add wave -noupdate /uart_tx_tb/uart_tx/cnt
add wave -noupdate /uart_tx_tb/uart_tx/number
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22000000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 187
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
WaveRestoreZoom {0 ps} {508618518 ps}

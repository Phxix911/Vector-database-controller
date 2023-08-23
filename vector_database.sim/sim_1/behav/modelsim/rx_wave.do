onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /uart_rx_tb/clk
add wave -noupdate /uart_rx_tb/rst_n
add wave -noupdate /uart_rx_tb/rx
add wave -noupdate /uart_rx_tb/error
add wave -noupdate /uart_rx_tb/ready
add wave -noupdate /uart_rx_tb/dout
add wave -noupdate /glbl/GSR
add wave -noupdate /uart_rx_tb/uart_rx/RX_d1
add wave -noupdate /uart_rx_tb/uart_rx/RX_d2
add wave -noupdate /uart_rx_tb/uart_rx/RX_d3
add wave -noupdate /uart_rx_tb/uart_rx/Nextflag
add wave -noupdate /uart_rx_tb/uart_rx/flag
add wave -noupdate /uart_rx_tb/uart_rx/Nextready
add wave -noupdate -radix unsigned /uart_rx_tb/uart_rx/cnt
add wave -noupdate /uart_rx_tb/uart_rx/cnt_d
add wave -noupdate /uart_rx_tb/uart_rx/dout_reg
add wave -noupdate /uart_rx_tb/uart_rx/number
add wave -noupdate /uart_rx_tb/uart_rx/down
add wave -noupdate /uart_rx_tb/uart_rx/check
add wave -noupdate /uart_rx_tb/uart_rx/dout_total
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8893415 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 203
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
WaveRestoreZoom {0 ps} {62730340 ps}

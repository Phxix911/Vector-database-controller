onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -childformat {{{/Instruction_mem_tb/instruction_memory/ROM[18]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[17]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[16]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[15]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[14]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[13]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[12]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[11]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[10]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[9]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[8]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[7]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[6]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[5]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[4]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[3]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[2]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[1]} -radix hexadecimal} {{/Instruction_mem_tb/instruction_memory/ROM[0]} -radix hexadecimal}} -expand -subitemconfig {{/Instruction_mem_tb/instruction_memory/ROM[18]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[17]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[16]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[15]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[14]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[13]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[12]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[11]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[10]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[9]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[8]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[7]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[6]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[5]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[4]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[3]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[2]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[1]} {-radix hexadecimal} {/Instruction_mem_tb/instruction_memory/ROM[0]} {-radix hexadecimal}} /Instruction_mem_tb/instruction_memory/ROM
add wave -noupdate /Instruction_mem_tb/clk
add wave -noupdate /Instruction_mem_tb/write
add wave -noupdate /Instruction_mem_tb/valid
add wave -noupdate -radix hexadecimal /Instruction_mem_tb/data
add wave -noupdate -radix hexadecimal /Instruction_mem_tb/instruction
add wave -noupdate -radix hexadecimal /Instruction_mem_tb/instruction_addr
add wave -noupdate -radix hexadecimal /Instruction_mem_tb/addr
add wave -noupdate /glbl/GSR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {74401 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
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
WaveRestoreZoom {48693 ps} {167527 ps}

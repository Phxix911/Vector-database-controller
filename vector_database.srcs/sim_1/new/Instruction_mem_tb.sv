`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/19 22:43:49
// Design Name: 
// Module Name: Instruction_mem_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instruction_mem_tb(

    );
    parameter SIZE= 32;
    logic clk,write,valid;
    logic [SIZE-1:0] data,instruction;
    logic [7:0] addr,instruction_addr;
    
    rom instruction_memory(
        .clk(clk),
        .data(data),
        .addr(addr),
        .write(write),
        .instruction_addr(instruction_addr),
        .instruction(instruction),
        .valid(valid)
        
    );
    always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
     program test;
        default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            
            output addr,write,instruction_addr,instruction,valid;
            input data;
            endclocking
            
            initial begin
                cpu.valid <=0;
                cpu.write <=0;
                ##10
                cpu.addr <= 8'h00;
                ##1
                cpu.addr <= 8'h01;
                ##1
                cpu.write <= 1;
                cpu.instruction_addr <= 8'h05;
                cpu.instruction <= 8'h47;
                ##1
                cpu.valid <= 1;
                ##1
                cpu.instruction_addr <= 8'h06;
                cpu.instruction <= 8'h51;
                //read instructions
                //try to input instructions when it is not valid
                //try to input instructions when it is valid.
                
            end
     endprogram    
endmodule

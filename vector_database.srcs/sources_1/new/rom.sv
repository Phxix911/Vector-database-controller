`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/11 23:44:56
// Design Name: 
// Module Name: ROM
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

module rom#(parameter SIZE = 32)(
//standard signals
input  clk,
//BUS signals
output logic [SIZE-1:0] data,
input  [7:0] addr,
//make the ROM programmable
input write,
input [7:0]instruction_addr,
input [SIZE-1: 0] instruction
//input valid

 );
parameter RAMAddrWidth = 8;
//Memory
logic [SIZE-1:0] ROM [2**RAMAddrWidth-1:0];
// Load program
initial $readmemh("E:/EDU/Project_EDU/Xilinx_project/vector_database/ROM.txt", ROM);
//single port ram
always@(posedge clk) begin
    data <= ROM[addr];
    if(write) begin
      //  if(valid)
        ROM[instruction_addr] <= instruction;
    end
end
endmodule



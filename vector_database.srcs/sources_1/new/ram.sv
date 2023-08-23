`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/11 23:16:16
// Design Name: 
// Module Name: RAM
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


module ram #(parameter SIZE=64)(
 //standard signals
input logic CLK,
//BUS signals
inout logic [SIZE-1:0] BUS_DATA,
input logic [7:0] BUS_ADDR,
input logic BUS_WE
 );
parameter RAMBaseAddr = 0;
parameter RAMAddrWidth = 7; // 128 x 8-bits memory
//Tristate
logic [SIZE-1:0] BufferedBusData;
logic [SIZE-1:0] Out;
logic RAMBusWE;
//Only place data on the bus if the processor is NOT writing, and it is addressing this memory
assign BUS_DATA = (RAMBusWE) ? Out : 64'hZZZZZZZZZZZZZZZZ;
assign BufferedBusData = BUS_DATA;
//Memory
logic [SIZE-1:0] Mem [2**RAMAddrWidth-1:0];
// Initialise the memory for data preloading, initialising variables, and declaring constants
initial $readmemh("E:/EDU/Project_EDU/Xilinx_project/vector_database/RAM.txt", Mem);
//single port ram
    always@(posedge CLK) begin  
// Brute-force RAM address decoding. Think of a simpler way...
        if((BUS_ADDR >= RAMBaseAddr) & (BUS_ADDR < RAMBaseAddr + 128)) begin
            if(BUS_WE) begin
                Mem[BUS_ADDR[6:0]] <= BufferedBusData;
                RAMBusWE <= 1'b0;
            end else begin
                RAMBusWE <= 1'b1;
                Out <= Mem[BUS_ADDR[6:0]];
            end
        end else begin
            RAMBusWE <= 1'b0;
            Out <= 64'hZZZZZZZZZZZZZZZZ;
            end
    end
endmodule
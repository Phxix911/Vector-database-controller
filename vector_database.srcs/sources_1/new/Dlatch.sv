`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/09 03:16:08
// Design Name: 
// Module Name: Dlatch
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


module Dlatch(
    input clk,
    input d,
    output logic q
    );
    always_ff @(posedge clk) begin
        q<=d;
    end
endmodule

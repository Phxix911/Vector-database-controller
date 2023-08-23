`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/28 01:44:21
// Design Name: 
// Module Name: mux_10to2
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


module mux_10to2(
    input logic [3:0] Regselect1,
    input logic [3:0] Regselect2,
    input logic [63:0] Regarray[9:0],
    output logic [63:0] Reg1,
    output logic [63:0] Reg2
    );
    
    always@*  begin
        case Regselect1:
            4'b0000:
                Reg1 = 
            4'b0001:
        endcase
    end
endmodule

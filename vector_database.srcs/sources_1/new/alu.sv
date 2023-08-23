`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/12 00:39:53
// Design Name: 
// Module Name: ALU
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


module alu #(parameter SIZE = 64)(
//standard signals
input logic CLK,
input logic RESET,
//I/O
input logic [SIZE-1:0] IN_A,
input logic [SIZE-1:0] IN_B,
input logic [3:0] ALU_Op_Code,
output logic [SIZE-1:0] OUT_RESULT
);
logic [SIZE-1:0] Out;
//Arithmetic Computation
always@(posedge CLK) begin
if(RESET)
Out <= 0;
else begin
case (ALU_Op_Code)
//Maths Operations
//Add A + B
4'h0: Out <= IN_A + IN_B;
//Subtract A - B
4'h1: Out <= IN_A - IN_B;
//Multiply A * B
4'h2: Out <= IN_A * IN_B;
//Shift Left A << 1
4'h3: Out <= IN_A << 1;
//Shift Right A >> 1
4'h4: Out <= IN_A >> 1;
//Increment A+1
4'h5: Out <= IN_A + 1'b1;
//Increment B+1
4'h6: Out <= IN_B + 1'b1;
//Decrement A-1
4'h7: Out <= IN_A - 1'b1;
//Decrement B+1
4'h8: Out <= IN_B - 1'b1;
// In/Equality Operations
//A == B
4'h9: Out <= (IN_A == IN_B) ? 64'h01 : 64'h00;
//A > B
4'hA: Out <= (IN_A > IN_B) ? 64'h01 : 64'h00;
//A < B
4'hB: Out <= (IN_A < IN_B) ? 64'h01 : 64'h00;
//Default A
4'hC: Out <= IN_A ^ IN_B;

4'hD: Out <= IN_A & IN_B;
default: Out <= IN_A;
endcase
end
end
assign OUT_RESULT = Out;
endmodule


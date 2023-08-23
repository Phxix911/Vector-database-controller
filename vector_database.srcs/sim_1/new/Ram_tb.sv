`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/20 01:36:02
// Design Name: 
// Module Name: Ram_tb
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


module Ram_tb(

    );
    parameter SIZE = 64;
    logic clk,BUS_WE;
    wire [SIZE-1:0] BUS_DATA;
    logic [7:0] BUS_ADDR;
    logic [SIZE-1:0] data_in,data_out;
    ram ram(
        .CLK(clk),
        .BUS_DATA(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .BUS_WE(BUS_WE)
    );
    assign BUS_DATA = BUS_WE ? data_in : 64'hZZZZZZZZZZZZZZZZ;
    always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
   initial begin
        #52.5
        BUS_ADDR = 8'h01;
        BUS_WE =0;
        #5
        BUS_ADDR = 8'h02;
        #5
        BUS_ADDR = 8'h03;
        #5
        BUS_ADDR = 8'h81;
        #5
        data_in <= 64'h123456789abcdef0;
        BUS_WE = 1;
        BUS_ADDR <= 8'h04;
        #5
        data_in = 64'h56781100adefff23;
        BUS_ADDR = 8'h05;
        #5
        BUS_WE <=0;
    end  
 /*   program test;
         default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            output data_in,BUS_WE,BUS_ADDR;
            input  BUS_DATA;
            
            endclocking
            
        initial begin
                ##10
                cpu.BUS_ADDR <= 8'h01;
                cpu.BUS_WE <=0;
                ##1
                cpu.BUS_ADDR <= 8'h02;
                ##1
                cpu.BUS_ADDR <= 8'h03;
                ##1 
                cpu.data_in <= 64'h123456789abcdef0;
               // cpu.BUS_WE <= 1;
                cpu.BUS_ADDR <= 8'h04;
                ##1
                
                ##1
                cpu.data_in <= 64'h56781100adefff23;
                cpu.BUS_ADDR <= 8'h05;
                ##1
                cpu.BUS_WE <=0;
           end     
 
    
    endprogram    */
    
endmodule

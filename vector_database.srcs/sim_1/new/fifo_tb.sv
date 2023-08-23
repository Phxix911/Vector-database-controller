`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/20 04:19:02
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb(

    );
    logic clk,rst_n,write_enable, read_enable, shift,mode,valid,empty,full;
    logic [63:0] data_in,data_out;
    logic [7:0] BUS_ADDR;
   
    long_stack #(64,8'h80)long_fifo(
        .clk_i(clk),
        .rst_n(rst_n),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .data_in(data_in),
        .BUS_ADDR(BUS_ADDR),
        .shift(shift),
        .mode(mode),
        .data_out(data_out),
        .valid(valid),
        .empty(empty),
        .full(full)
    );
      always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
     program test;
         default clocking cpu@(posedge clk);
            default input #1step output #1.5;
             output negedge rst_n;
            output data_in,BUS_ADDR,write_enable,read_enable,shift,mode;
            input data_out ,valid,empty,full;
            
            endclocking
            initial begin
                rst_n = 0;
                ##10 
                rst_n =1;
                ##20
                cpu.mode <=1;
                cpu.BUS_ADDR <= 8'h80;
                cpu.data_in <= 64'h0123456789abcdef;
                cpu.write_enable <= 1;
                ##1
                cpu.data_in <= 64'h5acc786ef11763bd;
                ##1
                cpu.data_in <= 64'h7749abc2176acf22;
                ##1
                cpu.data_in <= 64'hc1bdef55316a94d7;
                cpu.mode <=0;
                ##1
                cpu.write_enable <=0;
                cpu.read_enable <=1;
                cpu.BUS_ADDR <= 8'h80;
            end
     endprogram
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/03 22:08:56
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb(
    
        
    );
    logic clk,rst,req;
    logic [63:0] din;
    logic tx, readable, valid;
    uart_tx uart_tx(
        .clk(clk),
        .rst_n(rst),
        .req(req),
        .din(din),
        .tx(tx),
        .readable(readable),
        .valid(valid)
    );
    always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
    program test;
            default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            output negedge rst;
            output din,req,valid;
            input tx;
            endclocking
            initial begin
                rst = 0;
                ##10 rst = 1;
                
                cpu.req <= 1;
                cpu.din <= 64'h123456789abcd123;
                cpu.valid <= 1;
            end
            initial begin
               #5000    //IDLE bit   should be 1
               assert(cpu.tx ==1'b0);
               #7000         //12000ns  start bit 
               assert(cpu.tx ==1'b0);
               #10000       //22000ns  1st  bit
               assert(cpu.tx == 1'b1);
               #8680
               assert(cpu.tx == 1'b1);  
               #8680
               assert(cpu.tx == 1'b0);
               #8680
               assert(cpu.tx == 1'b0);
               #8680
               assert(cpu.tx == 1'b0);
               #8680
               assert(cpu.tx == 1'b1);  
               #8680
               assert(cpu.tx == 1'b0);   
               #8680
               assert(cpu.tx == 1'b0);
               #8680      //check bit
               assert(cpu.tx == 1'b1);       
               #8680      //stop bit
               assert(cpu.tx == 1'b1);
            end
    endprogram
endmodule

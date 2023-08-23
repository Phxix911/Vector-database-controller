`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 22:48:01
// Design Name: 
// Module Name: uart
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


module uart(
            input  clk,
            input  rst_n, 
            input  req, 
            input  rx, 
            input valid,
            input  [63:0] din,
            output  error, 
            output tx,
            output  [63:0] dout,
            output   ready,
            output readable
            
            );
 

uart_tx uart_tx(.clk(clk),
                .rst_n(rst_n),
                .req(req),
                .din(din),
                .tx(tx),
                .readable(readable),
                .valid(valid));
 
uart_rx uart_rx(.clk(clk),
                .rst_n(rst_n),
                .rx(rx),
                .error(error),
                .dout(dout),
                .ready(ready));
 
endmodule

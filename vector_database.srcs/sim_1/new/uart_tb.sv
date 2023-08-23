`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 23:12:33
// Design Name: 
// Module Name: uart_tb
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



 
module uart_tb;
 
logic clk,rst,req,ready;
logic [7:0] din1, din2;
 
logic error1, error2;
logic [7:0] dout1, dout2;
 
logic l1, l2;
 
initial begin
    clk = 0;
    rst = 1;
    din1 = 8'b0111_0111;
    din2 = 8'b1100_1100;
 
    # 1 rst = 0;
    # 2 rst = 1;
    # 5 req = 1;
end
 
    always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
 
uart uart1(.clk(clk),        //UART1Ä£¿é
           .rst(rst), 
           .req(req), 
           .rx(l2),
           .din(din1),
           .error(error1),
           .tx(l1),
           .dout(dout1),
           .ready(ready));
 
uart uart2(.clk(clk),        //UART2Ä£¿é
           .rst(rst), 
           .req(req), 
           .rx(l1),
           .din(din2),
           .error(error2),
           .tx(l2),
           .dout(dout2),
           .ready(ready));
    program test;
         default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            output negedge rst;
            output din1,din2,req;
            endclocking
            initial begin
              
                rst = 1;
                din1 = 8'b0111_0111;
                din2 = 8'b1100_1100;
                
                ## 1 rst = 0;
          
                ## 5 req = 1;
            end
    endprogram
endmodule

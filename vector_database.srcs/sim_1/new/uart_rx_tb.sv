`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/19 05:06:33
// Design Name: 
// Module Name: uart_rx_tb
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


module uart_rx_tb(

    );
    logic clk,rst_n,rx,error,ready;
    logic [63:0] dout;
        uart_rx uart_rx(
        .clk(clk),
        .rst_n(rst_n),        
        .rx(rx),
        .error(error),
        .dout(dout),
        .ready(ready)
    );
       always begin   //200MHZ
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
     program test;
            default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            output negedge rst_n;
            output rx;
            input ready,dout,error;
            endclocking
            initial begin
                 rst_n = 0;
                ##10 rst_n = 1;
                 cpu.rx <=1;
                #100 rx<=0;   //sart     D1
                #5000 rx<=1;  //first bit
                #8680 rx<=0;  
                #8680 rx<=0;  
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;//eighth bit
                #8680 rx<=0;//check bit
                #8680 rx<=1;   //stop bit
                
                
                #8680 rx<=0;  //start bit     01
                #5000 rx<=1;  //first bit  of second package
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit
                
                #8680 rx<=0;  //start bit    E5
                #5000 rx<=1;  //first bit  of third package
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit 
                
                #8680 rx<=0;  //start bit    64
                #5000 rx<=0;  //first bit  of fourth package
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit   
                
                #8680 rx<=0;  //start bit    E5
                #5000 rx<=1;  //first bit  of fifth package
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit   
                
                #8680 rx<=0;  //start bit    65
                #5000 rx<=1;  //first bit  of sixth package
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;  //check bit
                #8680 rx<=1;  //stop bit  
                
                #8680 rx<=0;  //start bit    E5
                #5000 rx<=1;  //first bit  of seventh package
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit 
                
                #8680 rx<=0;  //start bit    B6
                #5000 rx<=0;  //first bit  of eighth package
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;  //check bit
                #8680 rx<=1;  //stop bit 
                
                #8680 rx<=0;  //start bit    C9
                #5000 rx<=1;  //first bit  of  package
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=0;
                #8680 rx<=0;
                #8680 rx<=1;
                #8680 rx<=1;
                #8680 rx<=0;  //check bit
                #8680 rx<=1;  //stop bit 
            end
     endprogram
endmodule

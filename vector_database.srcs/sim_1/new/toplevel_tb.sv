`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 17:10:02
// Design Name: 
// Module Name: toplevel_tb
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


module toplevel_tb(
        
    );
    logic clk,reset; //l1,l2;
   
    logic l1,l2;
    logic [63:0] din;
    logic error;
    logic [63:0] dout;
    logic ready,req1,req2;
    logic [7:0] data_in;
    //CPU IO
    logic bus_interrupts_raise,bus_interrupts_ack;
    //ROM IO
    logic write;
    logic [7:0] instruction_addr;
    logic [31:0] instruction;
    //Uart1 
    logic valid;
    logic readable;
    toplevel top(
        .clk(clk),
        .rst_n(reset),
        .RX(l1),
        .TX(l2),
        .req(req2),
        .bus_interrupts_raise(bus_interrupts_raise),
        .bus_interrupts_ack(bus_interrupts_ack),
        .write(write),
        .instruction_addr(instruction_addr),
        .instruction(instruction)
    );

    
  uart uart1(
            .clk(clk),      
            .rst_n(reset),        
            .req(req1), 
            .rx(l2),
            .din(din),
            .error(error),
            .tx(l1),
            .dout(dout),
            .ready(ready),
            .valid(valid),
            .readable(readable)
      );
    always begin
        #2.5 clk = 0;
        #2.5 clk = 1;
    end
    program test;
       default clocking cpu@(posedge clk);
            default input #1step output #1.5;
            output negedge reset;
            output req1,req2,din,bus_interrupts_raise,write,instruction_addr,instruction,valid;
            input bus_interrupts_ack;
            endclocking
            initial begin
            #40200000
            cpu.req1 <= 0;
            end 
            initial begin  
             #690   cpu.req2 <= 1; 
             #823965 cpu.req2 <= 1;
             repeat(10) @cpu  cpu.req2 <= 0;
            end
            
            
           
            initial begin
                reset = 0;
                ##10 reset = 1;
                cpu.req1 <=1;
                cpu.req2 <=0;
                cpu.din <= 64'h777766662222BBFF;
                cpu.valid <= 1;
               #10500  //ns
            //   cpu.req2 <=1;
               cpu.write <= 1;
               cpu.instruction <= 32'h58100000;   //replace  0x81
               cpu.instruction_addr <= 8'h03;
               
               repeat(1) @cpu
               cpu.instruction <= 32'h15A85554; //first 32 bits for 0x 81
               cpu.instruction_addr <= 8'h04;
               repeat(1) @cpu
               cpu.instruction <= 32'h43567891; // second 32bits for 0x 81
               cpu.instruction_addr <= 8'h05;
               repeat(1) @cpu
               cpu.instruction <= 32'h20000000; // go back to IDLE
               cpu.instruction_addr <= 8'h06;  // end of first program
               repeat(1) @cpu
               cpu.write <= 0;
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 1;   // 1st time trigger 
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 0;
               repeat(20) @cpu
               cpu.write <= 0;
               repeat(1) @cpu
               cpu.write <= 1;   // this line doesn't wait until after 20 cycles?
               cpu.instruction <= 32'h68000000;   //change the pointer location of long stack 1 to 0
               cpu.instruction_addr <= 8'h03;
               repeat(1) @cpu
               cpu.instruction <= 32'hD8080000;  //Inv Sign of 0X80 at 1 put back to 0X80  3 
               cpu.instruction_addr <= 8'h04;    
               repeat(1) @cpu
               cpu.instruction <= 32'h20000000;  //IDLE
               cpu.instruction_addr <= 8'h05;
               repeat(1) @cpu
               cpu.instruction <= 32'hZZZZZZZZ;  //clear this location
               cpu.instruction_addr <= 8'h06;
               repeat(1) @cpu
               cpu.write <= 0;
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 1;   //2nd time trigger
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 0;    
               repeat(30) @cpu 
               cpu.write <= 0;
               repeat(1) @cpu
               cpu.write <= 1;
               cpu.instruction <= 32'hF8081820;   //Tan distance of two short vectors, put result in 0X82
               cpu.instruction_addr <= 8'h03;
               repeat(1) @cpu
               cpu.instruction <= 32'h18084000; //Move 0X80 3  to 0X83 1
               cpu.instruction_addr <= 8'h04; 
               repeat(1) @cpu
               cpu.instruction <= 32'h20000000;  //IDLE
               cpu.instruction_addr <= 8'h05;    
               repeat(1) @cpu
               cpu.write <= 0;    
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 1;   //3nd time trigger
               repeat(1) @cpu
               cpu.bus_interrupts_raise <= 0;      
               repeat(30) @cpu 
               cpu.write <= 0;
               
                         
                                                                                              
            end
    endprogram
endmodule

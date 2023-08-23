`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 03:07:52
// Design Name: 
// Module Name: toplevel
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


module toplevel(
        input  clk,
        input  rst_n,
        input  RX,
        output logic TX,
        input req,
        input bus_interrupts_raise,
        output bus_interrupts_ack,
        //ROM
        input write,
        input [7:0] instruction_addr,
        input [31:0] instruction
      //  input logic write_enable,
      //  input logic [7:0] data_in
    );
    parameter SIZE = 64;
    parameter SIZE1 = 32;
    //ios of cpu
    wire [SIZE-1:0] BUS_DATA;
    logic [7:0] BUS_ADDR;
    logic BUS_WE,BUS_RE,shift,mode;
    logic [7:0] ROM_ADDRESS;
    logic [SIZE1-1:0] ROM_DATA;
    
    //
    logic ready,valid;
    logic [63:0] din;
    logic error,readable;
    logic [63:0] dout;
    //ROM
    
    cpu p(
    .clk(clk),
    .rst_n(rst_n),  
    .bus_data(BUS_DATA), 
    .bus_addr(BUS_ADDR),
    .bus_we(BUS_WE),  
    .bus_re(BUS_RE),
    .rom_address(ROM_ADDRESS), 
    .rom_data(ROM_DATA),
    .bus_interrupts_raise(bus_interrupts_raise),
    .bus_interrupts_ack(bus_interrupts_ack),
    .shift(shift),
    .mode(mode)                         
    );
    rom rom(
        .clk(clk),
        .data(ROM_DATA),
        .addr(ROM_ADDRESS),
        .write(write),
        .instruction_addr(instruction_addr),
        .instruction(instruction)
        
    );
    ram ram(
        .CLK(clk),
        .BUS_DATA(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .BUS_WE(BUS_WE)
    );
    long_stack #(64,8'h80) stack1(
        .clk_i(clk),
        .rst_n(rst_n),
        .write_enable(BUS_WE),
        .read_enable(BUS_RE),
        .data_in(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .shift(shift),
        .mode(mode),
        .data_out(BUS_DATA)
    );
    long_stack #(64,8'h81) stack2(
        .clk_i(clk),
        .rst_n(rst_n),
        .write_enable(BUS_WE),
        .read_enable(BUS_RE),
        .data_in(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .shift(shift),
        .mode(mode),        
        .data_out(BUS_DATA)
    );
    long_stack #(64,8'h82) stack3(
        .clk_i(clk),
        .rst_n(rst_n),
        .write_enable(BUS_WE),
        .read_enable(BUS_RE),
        .data_in(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .shift(shift),
        .mode(mode), 
        .data_out(BUS_DATA)
    );  
    
    fifo_interface #(64, 8'h83) uart_input(
        .clk_load_i(clk),
        .rst(rst_n),
        .write_enable(ready),
        .read_enable(!BUS_WE),
        .data_in(dout),
        .BUS_ADDR(BUS_ADDR),
        .data_out(BUS_DATA)        
    );
   fifo_out #(64, 8'h84) fifo_out(
        .clk_load_i(clk),
        .rst(rst_n),
        .write_enable(BUS_WE),
        .read_enable(readable),
        .data_in(BUS_DATA),
        .BUS_ADDR(BUS_ADDR),
        .data_out(din),
        .valid(valid)
   );
   uart uart2(  .clk(clk),        //UART2Ä£¿é
                .rst_n(rst_n), 
                .req(req), 
                .rx(RX),
                .valid(valid),
                .din(din),
                .error(error),
                .tx(TX),
                .dout(dout),
                .ready(ready),
                .readable(readable) 
         );  
endmodule

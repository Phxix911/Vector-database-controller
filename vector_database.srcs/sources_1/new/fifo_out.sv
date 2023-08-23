`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 01:09:38
// Design Name: 
// Module Name: fifo_e
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/28 18:32:50
// Design Name: 
// Module Name: FIFO
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


module fifo_out #(parameter DATA_WIDTH = 80, ADDR=8'h80 )(
  input logic clk_load_i,
  input logic rst,
  input logic write_enable,
  input logic read_enable,
  input logic [DATA_WIDTH-1:0] data_in,
  input logic [7:0] BUS_ADDR,
  output logic [DATA_WIDTH-1:0] data_out,
  output logic empty,
  output logic full,
  output logic valid
  
);

  parameter DEPTH = 3;  // FIFO 深度
 // parameter DATA_WIDTH = 80;  // 数据位宽

 
  logic [DATA_WIDTH-1:0] memory [2**DEPTH-1:0];
  logic [DEPTH-1:0] read_pointer;
  logic [DEPTH-1:0] write_pointer;
  logic [DEPTH-1:0] next_write_pointer;
  logic [DEPTH-1:0] next_read_pointer;

  assign next_write_pointer = write_enable ? write_pointer + 1'b1 : write_pointer;
  assign next_read_pointer = read_enable ? read_pointer + 1'b1 : read_pointer;
  always @(posedge clk_load_i) begin
    if(!rst) begin
        
        write_pointer <= 0;
        read_pointer <= 0;
      
    end
    else if (read_enable) begin      
        data_out <= memory[read_pointer]; 
        read_pointer <= next_read_pointer;
        valid <=1;
    end
    else begin
    valid <=0;
    data_out <= 64'hZZZZZZZZZZZZZZZZ;
    end
  end
  
  
  always @(posedge clk_load_i) begin
    if (!rst) begin
      write_pointer <= 0;
      read_pointer <= 0;
     
    end
    else if (write_enable && BUS_ADDR == ADDR) begin   
        memory[write_pointer] <= data_in; 
        write_pointer <= next_write_pointer; 
    end
  end

  assign empty = (write_pointer == read_pointer);
  assign full = (next_write_pointer == read_pointer);

endmodule



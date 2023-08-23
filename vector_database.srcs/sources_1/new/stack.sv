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


module stack #(parameter DATA_WIDTH = 80, ADDR=8'h80 )(
  input  clk_i,
  input  rst,
  input  write_enable,
  input  read_enable,
  input  [DATA_WIDTH-1:0] data_in,
  input  [7:0] BUS_ADDR,
  input shift,
  output logic [DATA_WIDTH-1:0] data_out,
  output logic valid
  
);

  parameter DEPTH = 3;  // FIFO 深度
 // parameter DATA_WIDTH = 80;  // 数据位宽

 
  logic [DATA_WIDTH-1:0] memory [2**DEPTH-1:0];  //64 short HVs   8 long HVs
  logic [DEPTH-1:0] fast_pointer=0;
  logic [DEPTH-1:0] slow_pointer=0;
  logic [DEPTH-1:0] next_fast_pointer;
  logic [DEPTH-1:0] next_slow_pointer;
  logic [DEPTH-1:0] fast_pointer_l = 0,slow_pointer_l = 0, next_fastpointer_l,next_slowpointer_l; 
  assign next_fast_pointer = read_enable ? fast_pointer + 1'b1 : fast_pointer;
  assign next_slow_pointer = read_enable ? slow_pointer + 1'b1 : slow_pointer;
  always @(posedge clk_i) begin   //1
    if(rst) begin  //2
        
        fast_pointer <= 0;
        slow_pointer <= 0;
        
    end  //2
    else if(shift == 1 && BUS_ADDR == ADDR) begin  //3
        fast_pointer <= data_in[0+:DEPTH];
        if(data_in[0+:DEPTH] < fast_pointer )  slow_pointer <= next_slow_pointer;
    end else begin  //3   4
        if (read_enable && BUS_ADDR == ADDR) begin      //5  
            data_out <= memory[fast_pointer]; 
            fast_pointer <= next_fast_pointer;
            valid <=1;
            if(fast_pointer == 2**DEPTH-1) slow_pointer <= next_slow_pointer;
        end   //5
        else  begin   //6
            if (write_enable && BUS_ADDR == ADDR) begin     //7
            memory[fast_pointer] <= data_in; 
            fast_pointer <= next_fast_pointer; 
            if(fast_pointer == 2**DEPTH-1) slow_pointer <= next_slow_pointer;
            end  //7
            else begin  //8
                valid <=0;
                data_out <= 64'hZZZZZZZZZZZZZZZZ;
            
            end  //8
        end  //6
     end  //4
   
    
  end  //1
  
  




endmodule



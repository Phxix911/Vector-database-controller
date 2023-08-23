
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


module long_stack #(parameter DATA_WIDTH = 80, ADDR=8'h80 )(
  input  clk_i,
  input  rst_n,
  input  write_enable,
  input  read_enable,
  input  [DATA_WIDTH-1:0] data_in,
  input  [7:0] BUS_ADDR,
  input shift,
  input mode,
  output logic [DATA_WIDTH-1:0] data_out,
  output logic valid,
  output empty,
  output full
  
);

  parameter DEPTH = 6;  // FIFO 深度
 // parameter DATA_WIDTH = 80;  // 数据位宽

  
  logic [DATA_WIDTH-1:0] memory [2**DEPTH-1:0];   //64 *  
  logic [DEPTH-1:0] write_pointer=0;
  logic [DEPTH-1:0] read_pointer=0;
  logic [DEPTH-1:0] next_write_pointer;
  logic [DEPTH-1:0] next_read_pointer;
  logic [DEPTH-1:0] write_lpointer ,read_lpointer;  
   logic [DEPTH-1:0] next_write_lpointer , next_read_lpointer ;
  assign next_write_pointer = (read_enable|write_enable) ? write_pointer + 1'b1 : write_pointer;
  assign next_read_pointer = (read_enable|write_enable) ? read_pointer + 1'b1 : read_pointer;
  assign next_write_lpointer = (read_enable|write_enable) ? write_lpointer + 1'b1 : write_lpointer;
  assign next_read_lpointer = (read_enable|write_enable) ? read_lpointer + 1'b1 : read_lpointer;
  always @(posedge clk_i) begin   //1
    if(!rst_n) begin  //2
        write_lpointer <= 0;
        read_lpointer <= 0;
        write_pointer <= 0;
        read_pointer <= 0;
        
    end  //2
    else if(shift == 1 && BUS_ADDR == ADDR) begin  //3
        if(mode) begin 
            read_lpointer <= data_in[0+:DEPTH];
        //    if(data_in[0+:DEPTH] < fast_lpointer )  slow_lpointer <= slow_lpointer + 1;
        end
        else begin 
            read_pointer <= data_in[0+:DEPTH];
      //      if(data_in[0+:DEPTH] < fast_pointer )  slow_pointer <= next_slow_pointer;
         end
    end else begin  //3   4
        if (read_enable && BUS_ADDR == ADDR) begin      //5 
             if(mode) begin
               data_out <= memory[read_lpointer]; 
                read_lpointer <= next_read_lpointer;
                
             //   if(fast_lpointer == 2**DEPTH-1) slow_lpointer <= slow_lpointer + 1;
             end
             else begin
                data_out <= memory[read_pointer]; 
                read_pointer <= next_read_pointer;
                
            //    if(fast_pointer == 2**DEPTH-1) slow_pointer <= next_slow_pointer;
             end
                valid <=1;
        end   //5
        else  begin   //6
            if (write_enable && BUS_ADDR == ADDR) begin     //7
                if(mode) begin
                    memory[write_lpointer] <= data_in; 
                    write_lpointer <=  next_write_lpointer; 
                  //  if(fast_lpointer == 2**DEPTH-1) slow_lpointer <= slow_lpointer + 1;
                end
                else begin
                    memory[write_pointer] <= data_in; 
                    write_pointer <= next_write_pointer; 
                 //   if(fast_pointer == 2**DEPTH-1) slow_pointer <= next_slow_pointer;
                end
           
            end  //7
            else begin  //8
                valid <=0;
                data_out <= {DATA_WIDTH{1'bZ}};
            
            end  //8
        end  //6
     end  //4
   
    
  end  //1
  
    assign empty = (write_pointer == read_pointer)&(write_lpointer==read_lpointer);
    assign full = (next_write_pointer == read_pointer)|(next_write_lpointer == read_lpointer);




endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 22:00:36
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input  clk,
    input  rst_n,
    input  req,
    input  [63:0] din,
    output logic tx,
    output logic readable,
    input valid);

logic [63:0] din_total;
logic [16:0] cnt;
logic [7:0] din_reg;
logic [4:0] cstate,nstate;
logic [2:0] number=0;
logic  Next_readable=0;
logic flag;
logic check_bit;
 //only one period of read is sent when req keep high.
 logic wave,next_wave;
parameter bps = 17'd1736;  //波特率为 600 bps
parameter Idle  = 4'b0000,
          Start = 4'b0001,
          Bit0  = 4'b0010,
          Bit1  = 4'b0011,
          Bit2  = 4'b0100,
          Bit3  = 4'b0101,
          Bit4  = 4'b0110,
          Bit5  = 4'b0111,
          Bit6  = 4'b1000,
          Bit7  = 4'b1001,
          Check = 4'b1010,
          Stop  = 4'b1011;
always_ff @(posedge clk) begin
    if(!rst_n) begin
        wave =0;
    end else begin
        readable = Next_readable;
        wave = next_wave;
    end  
       if(valid) din_total <= din;
end
        
//assign readable = Next_readable && !Next_readable1;   
always_ff@(posedge clk)
    begin
        if(!rst_n)  begin
            din_reg =8'b00000000;
            
         end
        else if(req) begin
              
                case(number)
                    3'b000: din_reg <= din_total[7:0];    
                    3'b001: din_reg <= din_total[15:8];
                    3'b010: din_reg <= din_total[23:16];
                    3'b011: din_reg <= din_total[31:24];
                    3'b100: din_reg <= din_total[39:32];
                    3'b101: din_reg <= din_total[47:40];
                    3'b110: din_reg <= din_total[55:48];
                    3'b111: din_reg <= din_total[63:56];
                endcase
            end
    end
    
always@(posedge clk)
    begin
        if(!rst_n)
            cnt <= 0;
            
        else begin
            if(cnt == bps - 1)    //计数器模块
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end
assign flag = (cnt == bps - 1) && req;  //请求发数据且满足波特率
//三段式状态机
always@(posedge clk)
    begin
        if(!rst_n)
            cstate <= Idle;
        else begin
            if(flag)
                cstate <= nstate;
            else
                cstate <= cstate;
        end
    end
always@(*)
    begin
        next_wave=wave;
        Next_readable = 0;
        if(req&!wave) begin
        Next_readable = 1;
        next_wave =1;
        end
        if(!req) next_wave =0;
        
        case(cstate)
            Idle:   nstate = Start;
            Start:  nstate = Bit0;
            Bit0:   nstate = Bit1;
            Bit1:   nstate = Bit2;
            Bit2:   nstate = Bit3;
            Bit3:   nstate = Bit4;
            Bit4:   nstate = Bit5;
            Bit5:   nstate = Bit6;
            Bit6:   nstate = Bit7;
            Bit7:   nstate = Check;
            Check:  nstate = Stop;
            Stop:   nstate = Idle;
            default:nstate = Idle;
        endcase
    end
always@(posedge clk)
    begin
        if(!rst_n)
            cstate <= Idle;
        else
            case(cstate)
                Idle:   tx <= 1;
                Start:  tx <= 0;
                Bit0:   tx <= din_reg[0];
                Bit1:   tx <= din_reg[1];
                Bit2:   tx <= din_reg[2];
                Bit3:   tx <= din_reg[3];
                Bit4:   tx <= din_reg[4];
                Bit5:   tx <= din_reg[5];
                Bit6:   tx <= din_reg[6];
                Bit7:   tx <= din_reg[7];
                Check:  tx <= check_bit;
                Stop: begin
                  tx <= 1;
                  if(flag) begin
                   if(number <7) number <= number+1;
                   else number <= 0;
                  end
                  end
                default:tx <= 1;
            endcase
    end
assign check_bit = ^din_reg;   //odd is 1  even is 0
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/12 22:18:02
// Design Name: 
// Module Name: uart_rx
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


module uart_rx(
    input  clk,
    input  rst_n, 
    input  rx, 
    output logic error,
    output  [63:0] dout,
    output logic ready
    );
 

logic RX_d1, RX_d2, RX_d3;
logic Nextflag,flag,Nextready;

logic [16:0] cnt,cnt_initial;
logic [3:0] cnt_d,next_cnt_d;
logic [7:0] dout_reg,next_dout_reg;
logic [3:0] number=0,next_number; 
logic down;
logic check;
logic [63:0] dout_total; 
parameter bps = 17'd1736;  //与发射端同步
   always_ff@(posedge clk ) begin
        if(!rst_n) begin
            cnt_d = 0;
            dout_reg = 8'b00000000;
            ready = 0;
            flag =0;
            number = 0;
        end
        else begin
            ready =Nextready;
            flag = Nextflag;
            cnt_d = next_cnt_d;
            dout_reg = next_dout_reg;
            number = next_number;
        end
        
    end
    
always_ff@(posedge clk)
    begin
        if(!rst_n)
            begin
                RX_d1 <= 0;
                RX_d2 <= 0;
                RX_d3 <= 0;
            end
        else begin
            RX_d1 <= rx ;
            RX_d2 <= RX_d1;   //打两拍，消除亚稳态
            RX_d3 <= RX_d2;
        end
    end
assign down = ~RX_d2 && RX_d3;    //检测下降沿

always_ff@(posedge clk)
    begin
        if(!rst_n)
            cnt <= 0;
        else begin
            if(flag)
                begin
                    if(cnt_initial == 100) begin
                        if(cnt == bps - 1)    //计数器模块
                            cnt <= 0;
                        else
                            cnt <= cnt + 1;  //when flag is 1 keep counting 
                    end
                    else  cnt_initial <= cnt_initial +1;
                end
            else begin
                cnt <= 0;   //flag is 0 invalid counting
                cnt_initial <=0;
            end
        end
    end
    
always_comb begin
     Nextflag = flag;
     next_cnt_d = cnt_d;
     next_dout_reg = dout_reg;
     Nextready =0;
     next_number = number;
     if(down)
     Nextflag =1;
      
        else begin
            if((cnt == bps - 1)&&(cnt_d <= 7))
                begin
                    next_cnt_d = cnt_d + 1;
                    next_dout_reg = {RX_d2,dout_reg[7:1]};
                end
            else if((cnt == bps - 1)&&(cnt_d == 8))
                begin
                    next_cnt_d = cnt_d + 1;
                    if(check == RX_d2)
                        error <= 0;
                    else 
                        error <= 1;
                end
            else if((cnt == bps - 1)&&(cnt_d == 9))
                begin
                    next_cnt_d = 0;
                    Nextflag = 0;
                                     
                    case (number)
                        4'b0000:  begin
                            Nextready =0;
                            dout_total[7:0] = dout_reg;
                            next_number = number+1;
                            end
                        4'b0001:  begin
                            dout_total[15:8] = dout_reg;  
                             next_number = number+1;  
                            end 
                        4'b0010:  begin
                            dout_total[23:16] = dout_reg;
                             next_number = number+1;
                            end
                        4'b0011:  begin
                            dout_total[31:24] = dout_reg; 
                             next_number = number+1;
                            end
                        4'b0100:  begin
                            dout_total[39:32] = dout_reg;
                             next_number = number+1;
                            end
                        4'b0101:  begin
                            dout_total[47:40] = dout_reg;
                             next_number = number+1;
                            end
                        4'b0110:  begin
                            dout_total[55:48] = dout_reg; 
                             next_number = number+1;
                            end
                        4'b0111:  begin
                            dout_total[63:56] = dout_reg;  
                            next_number = 0;
                            Nextready =1;
                           
                            end                       
                    endcase    
                    
                end
        end
    end
assign dout = dout_total; 
assign check = ^dout_reg;
endmodule

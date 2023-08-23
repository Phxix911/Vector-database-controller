// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Tue Aug 15 20:42:38 2023
// Host        : phxix running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/EDU/Project_EDU/Xilinx_project/vector_database/vector_database.sim/sim_1/synth/timing/modelsim/toplevel_tb_time_synth.v
// Design      : toplevel
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module cpu
   (bus_interrupts_ack_OBUF,
    Q,
    \CurrState_reg[5]_0 ,
    \CurrState_reg[5]_1 ,
    \CurrState_reg[2]_0 ,
    \CurrState_reg[6]_0 ,
    \CurrState_reg[7]_0 ,
    \CurrState_reg[2]_1 ,
    \CurrState_reg[1]_0 ,
    ADDRARDADDR,
    clk_IBUF_BUFG,
    \CurrProgCounter_reg[0]_0 ,
    \CurrState_reg[2]_2 ,
    \CurrState_reg[4]_0 ,
    \CurrState_reg[5]_2 ,
    \CurrProgCounterOffset_reg[1]_0 ,
    \CurrState_reg[6]_1 ,
    \CurrState_reg[7]_1 ,
    ROM_DATA,
    \CurrProgCounterOffset_reg[5]_0 ,
    bus_interrupts_raise_IBUF,
    \CurrProgCounterOffset_reg[0]_0 ,
    rst_n_IBUF,
    \CurrState_reg[0]_0 );
  output bus_interrupts_ack_OBUF;
  output [3:0]Q;
  output \CurrState_reg[5]_0 ;
  output \CurrState_reg[5]_1 ;
  output \CurrState_reg[2]_0 ;
  output \CurrState_reg[6]_0 ;
  output \CurrState_reg[7]_0 ;
  output \CurrState_reg[2]_1 ;
  output \CurrState_reg[1]_0 ;
  output [7:0]ADDRARDADDR;
  input clk_IBUF_BUFG;
  input \CurrProgCounter_reg[0]_0 ;
  input \CurrState_reg[2]_2 ;
  input \CurrState_reg[4]_0 ;
  input \CurrState_reg[5]_2 ;
  input \CurrProgCounterOffset_reg[1]_0 ;
  input \CurrState_reg[6]_1 ;
  input \CurrState_reg[7]_1 ;
  input [8:0]ROM_DATA;
  input \CurrProgCounterOffset_reg[5]_0 ;
  input bus_interrupts_raise_IBUF;
  input \CurrProgCounterOffset_reg[0]_0 ;
  input rst_n_IBUF;
  input \CurrState_reg[0]_0 ;

  wire [7:0]ADDRARDADDR;
  wire \CurrInterruptAck[0]_i_2_n_0 ;
  wire \CurrInterruptAck[0]_i_3_n_0 ;
  wire [7:0]CurrProgCounter;
  wire \CurrProgCounterOffset[0]_i_3_n_0 ;
  wire \CurrProgCounterOffset[1]_i_2_n_0 ;
  wire \CurrProgCounterOffset[5]_i_2_n_0 ;
  wire \CurrProgCounterOffset[7]_i_3_n_0 ;
  wire \CurrProgCounterOffset[7]_i_4_n_0 ;
  wire \CurrProgCounterOffset_reg[0]_0 ;
  wire \CurrProgCounterOffset_reg[1]_0 ;
  wire \CurrProgCounterOffset_reg[5]_0 ;
  wire \CurrProgCounterOffset_reg_n_0_[0] ;
  wire \CurrProgCounterOffset_reg_n_0_[1] ;
  wire \CurrProgCounterOffset_reg_n_0_[2] ;
  wire \CurrProgCounterOffset_reg_n_0_[3] ;
  wire \CurrProgCounterOffset_reg_n_0_[4] ;
  wire \CurrProgCounterOffset_reg_n_0_[5] ;
  wire \CurrProgCounterOffset_reg_n_0_[6] ;
  wire \CurrProgCounterOffset_reg_n_0_[7] ;
  wire \CurrProgCounter[0]_i_1_n_0 ;
  wire \CurrProgCounter[1]_i_1_n_0 ;
  wire \CurrProgCounter[1]_i_2_n_0 ;
  wire \CurrProgCounter[2]_i_1_n_0 ;
  wire \CurrProgCounter[2]_i_2_n_0 ;
  wire \CurrProgCounter[2]_i_3_n_0 ;
  wire \CurrProgCounter[3]_i_2_n_0 ;
  wire \CurrProgCounter[3]_i_3_n_0 ;
  wire \CurrProgCounter[3]_i_4_n_0 ;
  wire \CurrProgCounter[4]_i_2_n_0 ;
  wire \CurrProgCounter[4]_i_3_n_0 ;
  wire \CurrProgCounter[4]_i_4_n_0 ;
  wire \CurrProgCounter[4]_i_5_n_0 ;
  wire \CurrProgCounter[5]_i_1_n_0 ;
  wire \CurrProgCounter[5]_i_2_n_0 ;
  wire \CurrProgCounter[5]_i_3_n_0 ;
  wire \CurrProgCounter[6]_i_1_n_0 ;
  wire \CurrProgCounter[6]_i_2_n_0 ;
  wire \CurrProgCounter[6]_i_3_n_0 ;
  wire \CurrProgCounter[6]_i_4_n_0 ;
  wire \CurrProgCounter[6]_i_5_n_0 ;
  wire \CurrProgCounter[6]_i_6_n_0 ;
  wire \CurrProgCounter[7]_i_10_n_0 ;
  wire \CurrProgCounter[7]_i_11_n_0 ;
  wire \CurrProgCounter[7]_i_12_n_0 ;
  wire \CurrProgCounter[7]_i_13_n_0 ;
  wire \CurrProgCounter[7]_i_14_n_0 ;
  wire \CurrProgCounter[7]_i_15_n_0 ;
  wire \CurrProgCounter[7]_i_16_n_0 ;
  wire \CurrProgCounter[7]_i_17_n_0 ;
  wire \CurrProgCounter[7]_i_18_n_0 ;
  wire \CurrProgCounter[7]_i_19_n_0 ;
  wire \CurrProgCounter[7]_i_21_n_0 ;
  wire \CurrProgCounter[7]_i_2_n_0 ;
  wire \CurrProgCounter[7]_i_3_n_0 ;
  wire \CurrProgCounter[7]_i_4_n_0 ;
  wire \CurrProgCounter[7]_i_5_n_0 ;
  wire \CurrProgCounter[7]_i_6_n_0 ;
  wire \CurrProgCounter[7]_i_7_n_0 ;
  wire \CurrProgCounter[7]_i_8_n_0 ;
  wire \CurrProgCounter_reg[0]_0 ;
  wire \CurrProgCounter_reg[3]_i_1_n_0 ;
  wire \CurrProgCounter_reg[4]_i_1_n_0 ;
  wire [7:0]CurrState;
  wire \CurrState[0]_i_1_n_0 ;
  wire \CurrState[0]_i_2_n_0 ;
  wire \CurrState[0]_i_3_n_0 ;
  wire \CurrState[0]_i_4_n_0 ;
  wire \CurrState[0]_i_6_n_0 ;
  wire \CurrState[0]_i_7_n_0 ;
  wire \CurrState[1]_i_1_n_0 ;
  wire \CurrState[1]_i_2_n_0 ;
  wire \CurrState[1]_i_3_n_0 ;
  wire \CurrState[1]_i_4_n_0 ;
  wire \CurrState[1]_i_5_n_0 ;
  wire \CurrState[1]_i_6_n_0 ;
  wire \CurrState[2]_i_1_n_0 ;
  wire \CurrState[2]_i_2_n_0 ;
  wire \CurrState[2]_i_3_n_0 ;
  wire \CurrState[2]_i_4_n_0 ;
  wire \CurrState[2]_i_6_n_0 ;
  wire \CurrState[2]_i_7_n_0 ;
  wire \CurrState[2]_i_8_n_0 ;
  wire \CurrState[4]_i_1_n_0 ;
  wire \CurrState[4]_i_2_n_0 ;
  wire \CurrState[4]_i_4_n_0 ;
  wire \CurrState[4]_i_5_n_0 ;
  wire \CurrState[4]_i_6_n_0 ;
  wire \CurrState[4]_i_7_n_0 ;
  wire \CurrState[5]_i_1_n_0 ;
  wire \CurrState[5]_i_3_n_0 ;
  wire \CurrState[5]_i_4_n_0 ;
  wire \CurrState[5]_i_5_n_0 ;
  wire \CurrState[5]_i_6_n_0 ;
  wire \CurrState[5]_i_8_n_0 ;
  wire \CurrState[6]_i_1_n_0 ;
  wire \CurrState[6]_i_2_n_0 ;
  wire \CurrState[6]_i_3_n_0 ;
  wire \CurrState[6]_i_4_n_0 ;
  wire \CurrState[6]_i_6_n_0 ;
  wire \CurrState[6]_i_7_n_0 ;
  wire \CurrState[6]_i_8_n_0 ;
  wire \CurrState[7]_i_10_n_0 ;
  wire \CurrState[7]_i_3_n_0 ;
  wire \CurrState[7]_i_4_n_0 ;
  wire \CurrState[7]_i_5_n_0 ;
  wire \CurrState[7]_i_6_n_0 ;
  wire \CurrState[7]_i_7_n_0 ;
  wire \CurrState[7]_i_9_n_0 ;
  wire \CurrState_reg[0]_0 ;
  wire \CurrState_reg[1]_0 ;
  wire \CurrState_reg[2]_0 ;
  wire \CurrState_reg[2]_1 ;
  wire \CurrState_reg[2]_2 ;
  wire \CurrState_reg[4]_0 ;
  wire \CurrState_reg[5]_0 ;
  wire \CurrState_reg[5]_1 ;
  wire \CurrState_reg[5]_2 ;
  wire \CurrState_reg[6]_0 ;
  wire \CurrState_reg[6]_1 ;
  wire \CurrState_reg[7]_0 ;
  wire \CurrState_reg[7]_1 ;
  wire NextInterruptAck;
  wire NextProgCounter;
  wire [7:0]NextProgCounterOffset;
  wire NextState;
  wire [3:0]Q;
  wire [8:0]ROM_DATA;
  wire ROM_reg_i_10_n_0;
  wire ROM_reg_i_1_n_1;
  wire ROM_reg_i_1_n_2;
  wire ROM_reg_i_1_n_3;
  wire ROM_reg_i_2_n_0;
  wire ROM_reg_i_2_n_1;
  wire ROM_reg_i_2_n_2;
  wire ROM_reg_i_2_n_3;
  wire ROM_reg_i_3_n_0;
  wire ROM_reg_i_4_n_0;
  wire ROM_reg_i_5_n_0;
  wire ROM_reg_i_6_n_0;
  wire ROM_reg_i_7_n_0;
  wire ROM_reg_i_8_n_0;
  wire ROM_reg_i_9_n_0;
  wire bus_interrupts_ack_OBUF;
  wire bus_interrupts_raise_IBUF;
  wire clk_IBUF_BUFG;
  wire [6:0]count;
  wire [5:0]count__0;
  wire \count_reg[1]_i_2_n_0 ;
  wire \count_reg[4]_i_2_n_0 ;
  wire \count_reg[4]_i_3_n_0 ;
  wire \count_reg[5]_i_2_n_0 ;
  wire \count_reg[6]_i_10_n_0 ;
  wire \count_reg[6]_i_11_n_0 ;
  wire \count_reg[6]_i_1_n_0 ;
  wire \count_reg[6]_i_2_n_0 ;
  wire \count_reg[6]_i_3_n_0 ;
  wire \count_reg[6]_i_4_n_0 ;
  wire \count_reg[6]_i_5_n_0 ;
  wire \count_reg[6]_i_6_n_0 ;
  wire \count_reg[6]_i_8_n_0 ;
  wire p_0_in__0;
  wire rst_n_IBUF;
  wire [2:0]vector_count;
  wire vector_count__0;
  wire \vector_count_reg[0]_i_1_n_0 ;
  wire \vector_count_reg[1]_i_1_n_0 ;
  wire \vector_count_reg[2]_i_1_n_0 ;
  wire \vector_count_reg[2]_i_3_n_0 ;
  wire [3:3]NLW_ROM_reg_i_1_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \CurrInterruptAck[0]_i_1 
       (.I0(CurrState[2]),
        .I1(bus_interrupts_raise_IBUF),
        .I2(\CurrInterruptAck[0]_i_2_n_0 ),
        .I3(\CurrInterruptAck[0]_i_3_n_0 ),
        .I4(CurrState[7]),
        .I5(Q[1]),
        .O(NextInterruptAck));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CurrInterruptAck[0]_i_2 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\CurrInterruptAck[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \CurrInterruptAck[0]_i_3 
       (.I0(Q[0]),
        .I1(CurrState[0]),
        .O(\CurrInterruptAck[0]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \CurrInterruptAck_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextInterruptAck),
        .Q(bus_interrupts_ack_OBUF),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'h00000000AA0A0202)) 
    \CurrProgCounterOffset[0]_i_1 
       (.I0(\CurrProgCounterOffset_reg[0]_0 ),
        .I1(ROM_DATA[8]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(count[0]),
        .I5(\CurrProgCounterOffset[0]_i_3_n_0 ),
        .O(NextProgCounterOffset[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \CurrProgCounterOffset[0]_i_3 
       (.I0(Q[3]),
        .I1(CurrState[7]),
        .I2(CurrState[2]),
        .I3(Q[0]),
        .I4(CurrState[0]),
        .O(\CurrProgCounterOffset[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h008020A200802080)) 
    \CurrProgCounterOffset[1]_i_1 
       (.I0(\CurrProgCounterOffset[1]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(count[1]),
        .I5(\CurrProgCounterOffset_reg[1]_0 ),
        .O(NextProgCounterOffset[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \CurrProgCounterOffset[1]_i_2 
       (.I0(CurrState[0]),
        .I1(Q[0]),
        .I2(CurrState[2]),
        .I3(CurrState[7]),
        .O(\CurrProgCounterOffset[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \CurrProgCounterOffset[2]_i_1 
       (.I0(\CurrProgCounterOffset_reg[5]_0 ),
        .I1(count[2]),
        .I2(count[1]),
        .O(NextProgCounterOffset[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \CurrProgCounterOffset[3]_i_1 
       (.I0(\CurrProgCounterOffset_reg[5]_0 ),
        .I1(count[3]),
        .I2(count[2]),
        .I3(count[1]),
        .O(NextProgCounterOffset[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \CurrProgCounterOffset[4]_i_1 
       (.I0(count[2]),
        .I1(count[1]),
        .I2(count[3]),
        .I3(count[4]),
        .I4(\CurrProgCounterOffset_reg[5]_0 ),
        .O(NextProgCounterOffset[4]));
  LUT6 #(
    .INIT(64'hF70800FF00000000)) 
    \CurrProgCounterOffset[5]_i_1 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(\count_reg[6]_i_3_n_0 ),
        .I3(count[5]),
        .I4(\CurrProgCounterOffset[5]_i_2_n_0 ),
        .I5(\CurrProgCounterOffset_reg[5]_0 ),
        .O(NextProgCounterOffset[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hF7FFFFFF)) 
    \CurrProgCounterOffset[5]_i_2 
       (.I0(count[4]),
        .I1(count[1]),
        .I2(count[0]),
        .I3(count[2]),
        .I4(count[3]),
        .O(\CurrProgCounterOffset[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \CurrProgCounterOffset[6]_i_1 
       (.I0(\CurrProgCounterOffset_reg[5]_0 ),
        .I1(\CurrProgCounterOffset[7]_i_3_n_0 ),
        .I2(\CurrProgCounterOffset[7]_i_4_n_0 ),
        .O(NextProgCounterOffset[6]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \CurrProgCounterOffset[7]_i_1 
       (.I0(\CurrProgCounterOffset_reg[5]_0 ),
        .I1(\CurrProgCounterOffset[7]_i_3_n_0 ),
        .I2(\CurrProgCounterOffset[7]_i_4_n_0 ),
        .O(NextProgCounterOffset[7]));
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \CurrProgCounterOffset[7]_i_3 
       (.I0(count[6]),
        .I1(\count_reg[6]_i_3_n_0 ),
        .I2(count[5]),
        .I3(count[4]),
        .I4(count[3]),
        .O(\CurrProgCounterOffset[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \CurrProgCounterOffset[7]_i_4 
       (.I0(count[3]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[4]),
        .I5(count[5]),
        .O(\CurrProgCounterOffset[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF6F)) 
    \CurrProgCounterOffset[7]_i_5 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(\CurrInterruptAck[0]_i_3_n_0 ),
        .I3(CurrState[2]),
        .I4(CurrState[7]),
        .I5(Q[3]),
        .O(\CurrState_reg[5]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[0]),
        .Q(\CurrProgCounterOffset_reg_n_0_[0] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[1]),
        .Q(\CurrProgCounterOffset_reg_n_0_[1] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[2]),
        .Q(\CurrProgCounterOffset_reg_n_0_[2] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[3]),
        .Q(\CurrProgCounterOffset_reg_n_0_[3] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[4]),
        .Q(\CurrProgCounterOffset_reg_n_0_[4] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[5]),
        .Q(\CurrProgCounterOffset_reg_n_0_[5] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[6]),
        .Q(\CurrProgCounterOffset_reg_n_0_[6] ),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounterOffset_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(NextProgCounterOffset[7]),
        .Q(\CurrProgCounterOffset_reg_n_0_[7] ),
        .R(p_0_in__0));
  LUT6 #(
    .INIT(64'hA0A30000AFAFFFFF)) 
    \CurrProgCounter[0]_i_1 
       (.I0(ROM_DATA[0]),
        .I1(CurrState[0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CurrState[2]),
        .I5(CurrProgCounter[0]),
        .O(\CurrProgCounter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFB3BFBF808C80B0)) 
    \CurrProgCounter[1]_i_1 
       (.I0(ROM_DATA[1]),
        .I1(Q[0]),
        .I2(CurrState[2]),
        .I3(CurrState[0]),
        .I4(Q[1]),
        .I5(\CurrProgCounter[1]_i_2_n_0 ),
        .O(\CurrProgCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \CurrProgCounter[1]_i_2 
       (.I0(CurrProgCounter[1]),
        .I1(CurrProgCounter[0]),
        .O(\CurrProgCounter[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hCFAACFAACFAA00AA)) 
    \CurrProgCounter[2]_i_1 
       (.I0(\CurrProgCounter[2]_i_2_n_0 ),
        .I1(ROM_DATA[2]),
        .I2(Q[0]),
        .I3(CurrState[2]),
        .I4(\CurrProgCounter[6]_i_4_n_0 ),
        .I5(\CurrProgCounter[2]_i_3_n_0 ),
        .O(\CurrProgCounter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FFBF40BF40FF00)) 
    \CurrProgCounter[2]_i_2 
       (.I0(CurrState[0]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[0]),
        .I5(CurrProgCounter[1]),
        .O(\CurrProgCounter[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \CurrProgCounter[2]_i_3 
       (.I0(CurrProgCounter[2]),
        .I1(CurrProgCounter[0]),
        .I2(CurrProgCounter[1]),
        .O(\CurrProgCounter[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0FF0E1F0E1F0F0F0)) 
    \CurrProgCounter[3]_i_2 
       (.I0(CurrState[0]),
        .I1(\CurrProgCounter[6]_i_5_n_0 ),
        .I2(CurrProgCounter[3]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[1]),
        .I5(CurrProgCounter[0]),
        .O(\CurrProgCounter[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF5F5A0B1)) 
    \CurrProgCounter[3]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(ROM_DATA[3]),
        .I3(CurrState[0]),
        .I4(\CurrProgCounter[3]_i_4_n_0 ),
        .O(\CurrProgCounter[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \CurrProgCounter[3]_i_4 
       (.I0(CurrProgCounter[3]),
        .I1(CurrProgCounter[2]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[0]),
        .O(\CurrProgCounter[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h777788887FF70880)) 
    \CurrProgCounter[4]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(CurrProgCounter[4]),
        .I3(\CurrProgCounter[4]_i_4_n_0 ),
        .I4(\CurrProgCounter[4]_i_5_n_0 ),
        .I5(CurrState[0]),
        .O(\CurrProgCounter[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hF5F5A0B1)) 
    \CurrProgCounter[4]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(ROM_DATA[4]),
        .I3(CurrState[0]),
        .I4(\CurrProgCounter[4]_i_5_n_0 ),
        .O(\CurrProgCounter[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    \CurrProgCounter[4]_i_4 
       (.I0(CurrProgCounter[3]),
        .I1(CurrProgCounter[2]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[0]),
        .O(\CurrProgCounter[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \CurrProgCounter[4]_i_5 
       (.I0(CurrProgCounter[4]),
        .I1(CurrProgCounter[0]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[3]),
        .O(\CurrProgCounter[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hCFAACFAACFAA00AA)) 
    \CurrProgCounter[5]_i_1 
       (.I0(\CurrProgCounter[5]_i_2_n_0 ),
        .I1(ROM_DATA[5]),
        .I2(Q[0]),
        .I3(CurrState[2]),
        .I4(\CurrProgCounter[6]_i_4_n_0 ),
        .I5(\CurrProgCounter[5]_i_3_n_0 ),
        .O(\CurrProgCounter[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF77708880777F888)) 
    \CurrProgCounter[5]_i_2 
       (.I0(\CurrProgCounter[7]_i_19_n_0 ),
        .I1(CurrProgCounter[4]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CurrProgCounter[5]),
        .I5(\CurrProgCounter[6]_i_6_n_0 ),
        .O(\CurrProgCounter[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \CurrProgCounter[5]_i_3 
       (.I0(CurrProgCounter[5]),
        .I1(CurrProgCounter[3]),
        .I2(CurrProgCounter[2]),
        .I3(CurrProgCounter[1]),
        .I4(CurrProgCounter[0]),
        .I5(CurrProgCounter[4]),
        .O(\CurrProgCounter[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFAACFAACFAA00AA)) 
    \CurrProgCounter[6]_i_1 
       (.I0(\CurrProgCounter[6]_i_2_n_0 ),
        .I1(ROM_DATA[6]),
        .I2(Q[0]),
        .I3(CurrState[2]),
        .I4(\CurrProgCounter[6]_i_3_n_0 ),
        .I5(\CurrProgCounter[6]_i_4_n_0 ),
        .O(\CurrProgCounter[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F80708FFF00FF00)) 
    \CurrProgCounter[6]_i_2 
       (.I0(CurrProgCounter[4]),
        .I1(\CurrProgCounter[7]_i_19_n_0 ),
        .I2(\CurrProgCounter[6]_i_5_n_0 ),
        .I3(CurrProgCounter[6]),
        .I4(\CurrProgCounter[6]_i_6_n_0 ),
        .I5(CurrProgCounter[5]),
        .O(\CurrProgCounter[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \CurrProgCounter[6]_i_3 
       (.I0(CurrProgCounter[6]),
        .I1(CurrProgCounter[4]),
        .I2(\CurrProgCounter[7]_i_19_n_0 ),
        .I3(CurrProgCounter[5]),
        .O(\CurrProgCounter[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hCD)) 
    \CurrProgCounter[6]_i_4 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CurrState[0]),
        .O(\CurrProgCounter[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \CurrProgCounter[6]_i_5 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\CurrProgCounter[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1555555557FFFFFF)) 
    \CurrProgCounter[6]_i_6 
       (.I0(CurrProgCounter[4]),
        .I1(CurrProgCounter[0]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[3]),
        .I5(\CurrProgCounter[7]_i_17_n_0 ),
        .O(\CurrProgCounter[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \CurrProgCounter[7]_i_10 
       (.I0(CurrState[7]),
        .I1(Q[2]),
        .I2(Q[3]),
        .O(\CurrProgCounter[7]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \CurrProgCounter[7]_i_11 
       (.I0(vector_count[0]),
        .I1(vector_count[1]),
        .I2(vector_count[2]),
        .I3(Q[0]),
        .O(\CurrProgCounter[7]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \CurrProgCounter[7]_i_12 
       (.I0(CurrState[2]),
        .I1(Q[2]),
        .O(\CurrProgCounter[7]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \CurrProgCounter[7]_i_13 
       (.I0(CurrState[2]),
        .I1(Q[1]),
        .O(\CurrProgCounter[7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h000000E000000000)) 
    \CurrProgCounter[7]_i_14 
       (.I0(\count_reg[1]_i_2_n_0 ),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(CurrState[2]),
        .I5(CurrState[7]),
        .O(\CurrProgCounter[7]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000055553FFF)) 
    \CurrProgCounter[7]_i_15 
       (.I0(\CurrProgCounter[7]_i_21_n_0 ),
        .I1(\CurrState_reg[5]_0 ),
        .I2(Q[1]),
        .I3(CurrState[7]),
        .I4(CurrState[2]),
        .I5(Q[0]),
        .O(\CurrProgCounter[7]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h57FFFFFF)) 
    \CurrProgCounter[7]_i_16 
       (.I0(CurrProgCounter[4]),
        .I1(CurrProgCounter[0]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[3]),
        .O(\CurrProgCounter[7]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    \CurrProgCounter[7]_i_17 
       (.I0(CurrState[0]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\CurrProgCounter[7]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h15555555)) 
    \CurrProgCounter[7]_i_18 
       (.I0(CurrProgCounter[4]),
        .I1(CurrProgCounter[0]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[2]),
        .I4(CurrProgCounter[3]),
        .O(\CurrProgCounter[7]_i_18_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \CurrProgCounter[7]_i_19 
       (.I0(CurrProgCounter[3]),
        .I1(CurrProgCounter[2]),
        .I2(CurrProgCounter[1]),
        .I3(CurrProgCounter[0]),
        .O(\CurrProgCounter[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hF0F0F8F0F0FFFDFF)) 
    \CurrProgCounter[7]_i_2 
       (.I0(Q[1]),
        .I1(\CurrProgCounter[7]_i_5_n_0 ),
        .I2(\CurrProgCounter[7]_i_6_n_0 ),
        .I3(Q[0]),
        .I4(CurrState[2]),
        .I5(\CurrProgCounter[7]_i_7_n_0 ),
        .O(\CurrProgCounter[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \CurrProgCounter[7]_i_20 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(\CurrState_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h20000060)) 
    \CurrProgCounter[7]_i_21 
       (.I0(Q[3]),
        .I1(CurrState[7]),
        .I2(\count_reg[6]_i_11_n_0 ),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(\CurrProgCounter[7]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBB88888)) 
    \CurrProgCounter[7]_i_3 
       (.I0(\CurrProgCounter[7]_i_8_n_0 ),
        .I1(Q[1]),
        .I2(\CurrProgCounter_reg[0]_0 ),
        .I3(\CurrProgCounter[7]_i_10_n_0 ),
        .I4(\CurrProgCounter[7]_i_11_n_0 ),
        .I5(\CurrProgCounter[7]_i_12_n_0 ),
        .O(\CurrProgCounter[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF40FF)) 
    \CurrProgCounter[7]_i_4 
       (.I0(\CurrProgCounter[7]_i_13_n_0 ),
        .I1(\count_reg[6]_i_11_n_0 ),
        .I2(\CurrProgCounter[7]_i_10_n_0 ),
        .I3(Q[0]),
        .I4(\CurrProgCounter[7]_i_14_n_0 ),
        .I5(\CurrProgCounter[7]_i_15_n_0 ),
        .O(\CurrProgCounter[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA9AAA5AAA9AAA)) 
    \CurrProgCounter[7]_i_5 
       (.I0(CurrProgCounter[7]),
        .I1(\CurrProgCounter[7]_i_16_n_0 ),
        .I2(CurrProgCounter[5]),
        .I3(CurrProgCounter[6]),
        .I4(\CurrProgCounter[7]_i_17_n_0 ),
        .I5(\CurrProgCounter[7]_i_18_n_0 ),
        .O(\CurrProgCounter[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h88008B00)) 
    \CurrProgCounter[7]_i_6 
       (.I0(ROM_DATA[7]),
        .I1(Q[0]),
        .I2(CurrState[0]),
        .I3(CurrState[2]),
        .I4(Q[1]),
        .O(\CurrProgCounter[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    \CurrProgCounter[7]_i_7 
       (.I0(CurrProgCounter[7]),
        .I1(CurrProgCounter[5]),
        .I2(\CurrProgCounter[7]_i_19_n_0 ),
        .I3(CurrProgCounter[4]),
        .I4(CurrProgCounter[6]),
        .O(\CurrProgCounter[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h4040002240000040)) 
    \CurrProgCounter[7]_i_8 
       (.I0(Q[0]),
        .I1(CurrState[2]),
        .I2(\count_reg[1]_i_2_n_0 ),
        .I3(Q[2]),
        .I4(CurrState[7]),
        .I5(Q[3]),
        .O(\CurrProgCounter[7]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[0]_i_1_n_0 ),
        .Q(CurrProgCounter[0]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[1]_i_1_n_0 ),
        .Q(CurrProgCounter[1]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[2]_i_1_n_0 ),
        .Q(CurrProgCounter[2]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter_reg[3]_i_1_n_0 ),
        .Q(CurrProgCounter[3]),
        .R(p_0_in__0));
  MUXF7 \CurrProgCounter_reg[3]_i_1 
       (.I0(\CurrProgCounter[3]_i_2_n_0 ),
        .I1(\CurrProgCounter[3]_i_3_n_0 ),
        .O(\CurrProgCounter_reg[3]_i_1_n_0 ),
        .S(CurrState[2]));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter_reg[4]_i_1_n_0 ),
        .Q(CurrProgCounter[4]),
        .R(p_0_in__0));
  MUXF7 \CurrProgCounter_reg[4]_i_1 
       (.I0(\CurrProgCounter[4]_i_2_n_0 ),
        .I1(\CurrProgCounter[4]_i_3_n_0 ),
        .O(\CurrProgCounter_reg[4]_i_1_n_0 ),
        .S(CurrState[2]));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[5]_i_1_n_0 ),
        .Q(CurrProgCounter[5]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[6]_i_1_n_0 ),
        .Q(CurrProgCounter[6]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrProgCounter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(NextProgCounter),
        .D(\CurrProgCounter[7]_i_2_n_0 ),
        .Q(CurrProgCounter[7]),
        .R(p_0_in__0));
  MUXF7 \CurrProgCounter_reg[7]_i_1 
       (.I0(\CurrProgCounter[7]_i_3_n_0 ),
        .I1(\CurrProgCounter[7]_i_4_n_0 ),
        .O(NextProgCounter),
        .S(CurrState[0]));
  LUT6 #(
    .INIT(64'h5555555554545455)) 
    \CurrState[0]_i_1 
       (.I0(CurrState[0]),
        .I1(\CurrState[0]_i_2_n_0 ),
        .I2(\CurrState[0]_i_3_n_0 ),
        .I3(\CurrState[0]_i_4_n_0 ),
        .I4(\CurrState_reg[0]_0 ),
        .I5(\CurrState[0]_i_6_n_0 ),
        .O(\CurrState[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02020000CECEF300)) 
    \CurrState[0]_i_2 
       (.I0(\count_reg[6]_i_11_n_0 ),
        .I1(Q[3]),
        .I2(CurrState[7]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(CurrState[2]),
        .O(\CurrState[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBAAABBBBBAAAAABA)) 
    \CurrState[0]_i_3 
       (.I0(\CurrState[0]_i_7_n_0 ),
        .I1(Q[3]),
        .I2(CurrState[2]),
        .I3(Q[2]),
        .I4(Q[0]),
        .I5(CurrState[7]),
        .O(\CurrState[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFF8)) 
    \CurrState[0]_i_4 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(CurrState[7]),
        .O(\CurrState[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h20AA2002)) 
    \CurrState[0]_i_6 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(CurrState[2]),
        .I4(Q[2]),
        .O(\CurrState[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1000050510000404)) 
    \CurrState[0]_i_7 
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(bus_interrupts_raise_IBUF),
        .I4(CurrState[2]),
        .I5(Q[0]),
        .O(\CurrState[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCCDCCFDC)) 
    \CurrState[1]_i_1 
       (.I0(\CurrState[1]_i_2_n_0 ),
        .I1(\CurrState[1]_i_3_n_0 ),
        .I2(CurrState[0]),
        .I3(Q[0]),
        .I4(\CurrState[1]_i_4_n_0 ),
        .O(\CurrState[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hA2A0A22A)) 
    \CurrState[1]_i_2 
       (.I0(CurrState[2]),
        .I1(\count_reg[6]_i_11_n_0 ),
        .I2(CurrState[7]),
        .I3(Q[3]),
        .I4(Q[2]),
        .O(\CurrState[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF00F4)) 
    \CurrState[1]_i_3 
       (.I0(Q[2]),
        .I1(\CurrState[1]_i_5_n_0 ),
        .I2(\CurrState[1]_i_6_n_0 ),
        .I3(\count_reg[1]_i_2_n_0 ),
        .I4(\CurrState[2]_i_3_n_0 ),
        .O(\CurrState[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h30DC33DC000C30D0)) 
    \CurrState[1]_i_4 
       (.I0(\count_reg[6]_i_11_n_0 ),
        .I1(CurrState[7]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(CurrState[2]),
        .O(\CurrState[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00040004F0040004)) 
    \CurrState[1]_i_5 
       (.I0(CurrState[0]),
        .I1(CurrState[2]),
        .I2(CurrState[7]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(\CurrState[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000E20000)) 
    \CurrState[1]_i_6 
       (.I0(CurrState[7]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(CurrState[0]),
        .I4(CurrState[2]),
        .I5(Q[0]),
        .O(\CurrState[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEFEFEFFFE)) 
    \CurrState[2]_i_1 
       (.I0(\CurrState[2]_i_2_n_0 ),
        .I1(\CurrState[2]_i_3_n_0 ),
        .I2(\CurrState[2]_i_4_n_0 ),
        .I3(\CurrState_reg[2]_2 ),
        .I4(\CurrState[2]_i_6_n_0 ),
        .I5(Q[0]),
        .O(\CurrState[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A8A8A8A8A8A8A)) 
    \CurrState[2]_i_2 
       (.I0(CurrState[0]),
        .I1(\CurrState[2]_i_7_n_0 ),
        .I2(\CurrState[2]_i_8_n_0 ),
        .I3(CurrState[7]),
        .I4(Q[0]),
        .I5(\count_reg[1]_i_2_n_0 ),
        .O(\CurrState[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    \CurrState[2]_i_3 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(CurrState[2]),
        .I4(CurrState[0]),
        .O(\CurrState[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAA8A222A00000000)) 
    \CurrState[2]_i_4 
       (.I0(\CurrState[5]_i_3_n_0 ),
        .I1(CurrState[7]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(\CurrInterruptAck[0]_i_3_n_0 ),
        .O(\CurrState[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \CurrState[2]_i_6 
       (.I0(CurrState[7]),
        .I1(Q[1]),
        .O(\CurrState[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFA00EA00D700D700)) 
    \CurrState[2]_i_7 
       (.I0(Q[3]),
        .I1(CurrState[7]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\count_reg[6]_i_11_n_0 ),
        .I5(Q[2]),
        .O(\CurrState[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFC9FFFFFFFFFF)) 
    \CurrState[2]_i_8 
       (.I0(Q[2]),
        .I1(CurrState[7]),
        .I2(Q[3]),
        .I3(CurrState[2]),
        .I4(Q[0]),
        .I5(\count_reg[6]_i_11_n_0 ),
        .O(\CurrState[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CurrState[2]_i_9 
       (.I0(CurrState[2]),
        .I1(Q[3]),
        .O(\CurrState_reg[2]_1 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF45454500)) 
    \CurrState[4]_i_1 
       (.I0(CurrState[7]),
        .I1(\CurrState[4]_i_2_n_0 ),
        .I2(CurrState[2]),
        .I3(\CurrState_reg[4]_0 ),
        .I4(\CurrState[4]_i_4_n_0 ),
        .I5(\CurrState[4]_i_5_n_0 ),
        .O(\CurrState[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CurrState[4]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .O(\CurrState[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF100110011001100)) 
    \CurrState[4]_i_4 
       (.I0(Q[0]),
        .I1(CurrState[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(\count_reg[6]_i_11_n_0 ),
        .O(\CurrState[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEEEEFEEE)) 
    \CurrState[4]_i_5 
       (.I0(\CurrState[4]_i_6_n_0 ),
        .I1(\CurrState[4]_i_7_n_0 ),
        .I2(\CurrState[5]_i_3_n_0 ),
        .I3(\CurrInterruptAck[0]_i_3_n_0 ),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\CurrState[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hA00A00A08000000A)) 
    \CurrState[4]_i_6 
       (.I0(Q[1]),
        .I1(\count_reg[6]_i_11_n_0 ),
        .I2(Q[2]),
        .I3(CurrState[0]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(\CurrState[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h888C88800C8C0C80)) 
    \CurrState[4]_i_7 
       (.I0(CurrState[7]),
        .I1(Q[1]),
        .I2(CurrState[2]),
        .I3(CurrState[0]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\CurrState[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF00EA)) 
    \CurrState[5]_i_1 
       (.I0(\CurrState_reg[5]_2 ),
        .I1(\CurrState[5]_i_3_n_0 ),
        .I2(CurrState[7]),
        .I3(\CurrState[5]_i_4_n_0 ),
        .I4(\CurrState[5]_i_5_n_0 ),
        .I5(\CurrState[5]_i_6_n_0 ),
        .O(\CurrState[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFF800000)) 
    \CurrState[5]_i_3 
       (.I0(count[5]),
        .I1(count[4]),
        .I2(count[3]),
        .I3(count[6]),
        .I4(CurrState[2]),
        .O(\CurrState[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFAFAAEFEFFFAAAA)) 
    \CurrState[5]_i_4 
       (.I0(Q[0]),
        .I1(CurrState[2]),
        .I2(Q[2]),
        .I3(CurrState[7]),
        .I4(Q[3]),
        .I5(Q[1]),
        .O(\CurrState[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000F000F000E000)) 
    \CurrState[5]_i_5 
       (.I0(CurrState[7]),
        .I1(\count_reg[6]_i_11_n_0 ),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(CurrState[2]),
        .I5(Q[1]),
        .O(\CurrState[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00F0A0A0F0F0E0E0)) 
    \CurrState[5]_i_6 
       (.I0(CurrState[7]),
        .I1(Q[3]),
        .I2(\CurrState[5]_i_8_n_0 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\count_reg[6]_i_11_n_0 ),
        .O(\CurrState[5]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \CurrState[5]_i_7 
       (.I0(CurrState[7]),
        .I1(CurrState[2]),
        .O(\CurrState_reg[7]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0AAA0200)) 
    \CurrState[5]_i_8 
       (.I0(CurrState[0]),
        .I1(Q[3]),
        .I2(CurrState[7]),
        .I3(Q[0]),
        .I4(CurrState[2]),
        .O(\CurrState[5]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBBBBBBABAAAA)) 
    \CurrState[6]_i_1 
       (.I0(\CurrState[6]_i_2_n_0 ),
        .I1(\CurrState[6]_i_3_n_0 ),
        .I2(\CurrState[6]_i_4_n_0 ),
        .I3(\CurrState_reg[6]_1 ),
        .I4(\CurrState[6]_i_6_n_0 ),
        .I5(\CurrState[6]_i_7_n_0 ),
        .O(\CurrState[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \CurrState[6]_i_10 
       (.I0(CurrState[2]),
        .I1(Q[2]),
        .O(\CurrState_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CurrState[6]_i_2 
       (.I0(Q[3]),
        .I1(\CurrState[6]_i_8_n_0 ),
        .O(\CurrState[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h10115000)) 
    \CurrState[6]_i_3 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(CurrState[0]),
        .I3(CurrState[2]),
        .I4(Q[1]),
        .O(\CurrState[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \CurrState[6]_i_4 
       (.I0(vector_count[0]),
        .I1(vector_count[1]),
        .I2(vector_count[2]),
        .I3(Q[3]),
        .I4(CurrState[2]),
        .O(\CurrState[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \CurrState[6]_i_6 
       (.I0(CurrState[7]),
        .I1(Q[0]),
        .O(\CurrState[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h88A80020)) 
    \CurrState[6]_i_7 
       (.I0(CurrState[7]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(CurrState[2]),
        .I4(Q[3]),
        .O(\CurrState[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFC70F03FFC7C030)) 
    \CurrState[6]_i_8 
       (.I0(\count_reg[6]_i_11_n_0 ),
        .I1(CurrState[0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(CurrState[2]),
        .I5(Q[2]),
        .O(\CurrState[6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \CurrState[6]_i_9 
       (.I0(Q[3]),
        .I1(Q[2]),
        .O(\CurrState_reg[6]_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \CurrState[7]_i_1 
       (.I0(rst_n_IBUF),
        .O(p_0_in__0));
  LUT6 #(
    .INIT(64'hAA28AAAAAA20AAAA)) 
    \CurrState[7]_i_10 
       (.I0(CurrState[7]),
        .I1(CurrState[0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(CurrState[2]),
        .I5(\count_reg[6]_i_11_n_0 ),
        .O(\CurrState[7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hBFBBBFBF80888080)) 
    \CurrState[7]_i_3 
       (.I0(\CurrState[7]_i_6_n_0 ),
        .I1(\CurrState[7]_i_7_n_0 ),
        .I2(\CurrState_reg[7]_1 ),
        .I3(\CurrState[7]_i_9_n_0 ),
        .I4(CurrState[7]),
        .I5(\CurrState[7]_i_10_n_0 ),
        .O(\CurrState[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h733307F0F37F1FF1)) 
    \CurrState[7]_i_4 
       (.I0(CurrState[0]),
        .I1(CurrState[2]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\CurrState[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00FC0153FDFFF3F3)) 
    \CurrState[7]_i_5 
       (.I0(CurrState[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(CurrState[2]),
        .O(\CurrState[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hF0220F2F)) 
    \CurrState[7]_i_6 
       (.I0(CurrState[7]),
        .I1(CurrState[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(\CurrState[7]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \CurrState[7]_i_7 
       (.I0(Q[2]),
        .I1(CurrState[0]),
        .O(\CurrState[7]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \CurrState[7]_i_9 
       (.I0(CurrState[2]),
        .I1(Q[1]),
        .O(\CurrState[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[0]_i_1_n_0 ),
        .Q(CurrState[0]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[1]_i_1_n_0 ),
        .Q(Q[0]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[2]_i_1_n_0 ),
        .Q(CurrState[2]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[4]_i_1_n_0 ),
        .Q(Q[1]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[5]_i_1_n_0 ),
        .Q(Q[2]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[6]_i_1_n_0 ),
        .Q(Q[3]),
        .R(p_0_in__0));
  FDRE #(
    .INIT(1'b0)) 
    \CurrState_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(NextState),
        .D(\CurrState[7]_i_3_n_0 ),
        .Q(CurrState[7]),
        .R(p_0_in__0));
  MUXF7 \CurrState_reg[7]_i_2 
       (.I0(\CurrState[7]_i_4_n_0 ),
        .I1(\CurrState[7]_i_5_n_0 ),
        .O(NextState),
        .S(CurrState[7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 ROM_reg_i_1
       (.CI(ROM_reg_i_2_n_0),
        .CO({NLW_ROM_reg_i_1_CO_UNCONNECTED[3],ROM_reg_i_1_n_1,ROM_reg_i_1_n_2,ROM_reg_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,CurrProgCounter[6:4]}),
        .O(ADDRARDADDR[7:4]),
        .S({ROM_reg_i_3_n_0,ROM_reg_i_4_n_0,ROM_reg_i_5_n_0,ROM_reg_i_6_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_10
       (.I0(CurrProgCounter[0]),
        .I1(\CurrProgCounterOffset_reg_n_0_[0] ),
        .O(ROM_reg_i_10_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 ROM_reg_i_2
       (.CI(1'b0),
        .CO({ROM_reg_i_2_n_0,ROM_reg_i_2_n_1,ROM_reg_i_2_n_2,ROM_reg_i_2_n_3}),
        .CYINIT(1'b0),
        .DI(CurrProgCounter[3:0]),
        .O(ADDRARDADDR[3:0]),
        .S({ROM_reg_i_7_n_0,ROM_reg_i_8_n_0,ROM_reg_i_9_n_0,ROM_reg_i_10_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_3
       (.I0(\CurrProgCounterOffset_reg_n_0_[7] ),
        .I1(CurrProgCounter[7]),
        .O(ROM_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_4
       (.I0(CurrProgCounter[6]),
        .I1(\CurrProgCounterOffset_reg_n_0_[6] ),
        .O(ROM_reg_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_5
       (.I0(CurrProgCounter[5]),
        .I1(\CurrProgCounterOffset_reg_n_0_[5] ),
        .O(ROM_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_6
       (.I0(CurrProgCounter[4]),
        .I1(\CurrProgCounterOffset_reg_n_0_[4] ),
        .O(ROM_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_7
       (.I0(CurrProgCounter[3]),
        .I1(\CurrProgCounterOffset_reg_n_0_[3] ),
        .O(ROM_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_8
       (.I0(CurrProgCounter[2]),
        .I1(\CurrProgCounterOffset_reg_n_0_[2] ),
        .O(ROM_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    ROM_reg_i_9
       (.I0(CurrProgCounter[1]),
        .I1(\CurrProgCounterOffset_reg_n_0_[1] ),
        .O(ROM_reg_i_9_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.CLR(1'b0),
        .D(count__0[0]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h3010300F)) 
    \count_reg[0]_i_1 
       (.I0(Q[1]),
        .I1(\count_reg[1]_i_2_n_0 ),
        .I2(count[0]),
        .I3(CurrState[2]),
        .I4(Q[0]),
        .O(count__0[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.CLR(1'b0),
        .D(count__0[1]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[1]));
  LUT6 #(
    .INIT(64'h3030101030300FF0)) 
    \count_reg[1]_i_1 
       (.I0(Q[1]),
        .I1(\count_reg[1]_i_2_n_0 ),
        .I2(count[1]),
        .I3(count[0]),
        .I4(CurrState[2]),
        .I5(Q[0]),
        .O(count__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \count_reg[1]_i_2 
       (.I0(count[6]),
        .I1(count[3]),
        .I2(count[4]),
        .I3(count[5]),
        .O(\count_reg[1]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.CLR(1'b0),
        .D(count__0[2]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[2]));
  LUT6 #(
    .INIT(64'hAA03AB00AB00AB00)) 
    \count_reg[2]_i_1 
       (.I0(\count_reg[5]_i_2_n_0 ),
        .I1(CurrState[2]),
        .I2(Q[0]),
        .I3(count[2]),
        .I4(count[0]),
        .I5(count[1]),
        .O(count__0[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.CLR(1'b0),
        .D(count__0[3]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[3]));
  LUT6 #(
    .INIT(64'h000A0005000AF3F5)) 
    \count_reg[3]_i_1 
       (.I0(\count_reg[6]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(CurrState[2]),
        .I3(Q[0]),
        .I4(count[3]),
        .I5(count[6]),
        .O(count__0[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.CLR(1'b0),
        .D(count__0[4]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[4]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h0000FF1B)) 
    \count_reg[4]_i_1 
       (.I0(Q[0]),
        .I1(\count_reg[4]_i_2_n_0 ),
        .I2(Q[1]),
        .I3(CurrState[2]),
        .I4(\count_reg[4]_i_3_n_0 ),
        .O(count__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    \count_reg[4]_i_2 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[2]),
        .O(\count_reg[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hEEE0E0EE)) 
    \count_reg[4]_i_3 
       (.I0(Q[0]),
        .I1(CurrState[2]),
        .I2(count[6]),
        .I3(count[3]),
        .I4(count[4]),
        .O(\count_reg[4]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.CLR(1'b0),
        .D(count__0[5]),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[5]));
  LUT6 #(
    .INIT(64'hEAAEE0E0E0E0E0E0)) 
    \count_reg[5]_i_1 
       (.I0(\count_reg[5]_i_2_n_0 ),
        .I1(\count_reg[6]_i_4_n_0 ),
        .I2(count[5]),
        .I3(\count_reg[6]_i_3_n_0 ),
        .I4(count[3]),
        .I5(count[4]),
        .O(count__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h00AE)) 
    \count_reg[5]_i_2 
       (.I0(CurrState[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\count_reg[1]_i_2_n_0 ),
        .O(\count_reg[5]_i_2_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.CLR(1'b0),
        .D(\count_reg[6]_i_1_n_0 ),
        .G(\count_reg[6]_i_2_n_0 ),
        .GE(1'b1),
        .Q(count[6]));
  LUT6 #(
    .INIT(64'hFF7F008000000000)) 
    \count_reg[6]_i_1 
       (.I0(count[3]),
        .I1(count[4]),
        .I2(count[5]),
        .I3(\count_reg[6]_i_3_n_0 ),
        .I4(count[6]),
        .I5(\count_reg[6]_i_4_n_0 ),
        .O(\count_reg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hF2FFFFF2)) 
    \count_reg[6]_i_10 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(CurrState[2]),
        .I3(Q[3]),
        .I4(CurrState[7]),
        .O(\count_reg[6]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \count_reg[6]_i_11 
       (.I0(vector_count[2]),
        .I1(vector_count[1]),
        .I2(vector_count[0]),
        .O(\count_reg[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h88888888A8A8AAA8)) 
    \count_reg[6]_i_2 
       (.I0(\count_reg[6]_i_5_n_0 ),
        .I1(\count_reg[6]_i_6_n_0 ),
        .I2(\CurrProgCounterOffset_reg[1]_0 ),
        .I3(\count_reg[6]_i_8_n_0 ),
        .I4(\CurrState_reg[5]_0 ),
        .I5(\count_reg[6]_i_10_n_0 ),
        .O(\count_reg[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \count_reg[6]_i_3 
       (.I0(count[0]),
        .I1(count[1]),
        .I2(count[2]),
        .O(\count_reg[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \count_reg[6]_i_4 
       (.I0(CurrState[2]),
        .I1(Q[0]),
        .O(\count_reg[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000FFF80000CF)) 
    \count_reg[6]_i_5 
       (.I0(\count_reg[6]_i_11_n_0 ),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(CurrState[0]),
        .I5(CurrState[2]),
        .O(\count_reg[6]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hE9001400)) 
    \count_reg[6]_i_6 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(CurrState[7]),
        .I3(CurrState[2]),
        .I4(Q[1]),
        .O(\count_reg[6]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \count_reg[6]_i_8 
       (.I0(Q[1]),
        .I1(Q[3]),
        .O(\count_reg[6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \count_reg[6]_i_9 
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(\CurrState_reg[5]_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \vector_count_reg[0] 
       (.CLR(1'b0),
        .D(\vector_count_reg[0]_i_1_n_0 ),
        .G(vector_count__0),
        .GE(1'b1),
        .Q(vector_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \vector_count_reg[0]_i_1 
       (.I0(vector_count[0]),
        .O(\vector_count_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \vector_count_reg[1] 
       (.CLR(1'b0),
        .D(\vector_count_reg[1]_i_1_n_0 ),
        .G(vector_count__0),
        .GE(1'b1),
        .Q(vector_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \vector_count_reg[1]_i_1 
       (.I0(vector_count[0]),
        .I1(vector_count[1]),
        .O(\vector_count_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \vector_count_reg[2] 
       (.CLR(1'b0),
        .D(\vector_count_reg[2]_i_1_n_0 ),
        .G(vector_count__0),
        .GE(1'b1),
        .Q(vector_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \vector_count_reg[2]_i_1 
       (.I0(vector_count[0]),
        .I1(vector_count[1]),
        .I2(vector_count[2]),
        .O(\vector_count_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h00088280)) 
    \vector_count_reg[2]_i_2 
       (.I0(\vector_count_reg[2]_i_3_n_0 ),
        .I1(CurrState[2]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(CurrState[7]),
        .O(vector_count__0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h08048070)) 
    \vector_count_reg[2]_i_3 
       (.I0(Q[2]),
        .I1(CurrState[0]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CurrState[2]),
        .O(\vector_count_reg[2]_i_3_n_0 ));
endmodule

module rom
   (ROM_reg_0,
    \CurrState_reg[4] ,
    ROM_reg_1,
    ROM_reg_2,
    ROM_reg_3,
    ROM_reg_4,
    \CurrState_reg[5] ,
    ROM_reg_5,
    \CurrState_reg[4]_0 ,
    \CurrState_reg[6] ,
    \CurrState_reg[4]_1 ,
    clk_IBUF_BUFG,
    ADDRARDADDR,
    ADDRBWRADDR,
    instruction_IBUF,
    WEBWE,
    Q,
    \CurrProgCounterOffset_reg[5] ,
    \CurrState_reg[6]_0 ,
    \CurrState_reg[6]_1 ,
    \CurrState_reg[2] ,
    \CurrState_reg[2]_0 ,
    \CurrState_reg[5]_0 ,
    \CurrProgCounter[7]_i_3 );
  output [8:0]ROM_reg_0;
  output \CurrState_reg[4] ;
  output ROM_reg_1;
  output ROM_reg_2;
  output ROM_reg_3;
  output ROM_reg_4;
  output \CurrState_reg[5] ;
  output ROM_reg_5;
  output \CurrState_reg[4]_0 ;
  output \CurrState_reg[6] ;
  output \CurrState_reg[4]_1 ;
  input clk_IBUF_BUFG;
  input [7:0]ADDRARDADDR;
  input [7:0]ADDRBWRADDR;
  input [31:0]instruction_IBUF;
  input [0:0]WEBWE;
  input [3:0]Q;
  input \CurrProgCounterOffset_reg[5] ;
  input \CurrState_reg[6]_0 ;
  input \CurrState_reg[6]_1 ;
  input \CurrState_reg[2] ;
  input \CurrState_reg[2]_0 ;
  input \CurrState_reg[5]_0 ;
  input \CurrProgCounter[7]_i_3 ;

  wire [7:0]ADDRARDADDR;
  wire [7:0]ADDRBWRADDR;
  wire \CurrProgCounterOffset_reg[5] ;
  wire \CurrProgCounter[7]_i_3 ;
  wire \CurrState_reg[2] ;
  wire \CurrState_reg[2]_0 ;
  wire \CurrState_reg[4] ;
  wire \CurrState_reg[4]_0 ;
  wire \CurrState_reg[4]_1 ;
  wire \CurrState_reg[5] ;
  wire \CurrState_reg[5]_0 ;
  wire \CurrState_reg[6] ;
  wire \CurrState_reg[6]_0 ;
  wire \CurrState_reg[6]_1 ;
  wire [3:0]Q;
  wire [31:28]ROM_DATA;
  wire [8:0]ROM_reg_0;
  wire ROM_reg_1;
  wire ROM_reg_2;
  wire ROM_reg_3;
  wire ROM_reg_4;
  wire ROM_reg_5;
  wire ROM_reg_n_0;
  wire ROM_reg_n_1;
  wire ROM_reg_n_2;
  wire ROM_reg_n_20;
  wire ROM_reg_n_21;
  wire ROM_reg_n_22;
  wire ROM_reg_n_23;
  wire ROM_reg_n_24;
  wire ROM_reg_n_25;
  wire ROM_reg_n_26;
  wire ROM_reg_n_27;
  wire ROM_reg_n_28;
  wire ROM_reg_n_29;
  wire ROM_reg_n_3;
  wire ROM_reg_n_30;
  wire ROM_reg_n_31;
  wire ROM_reg_n_4;
  wire ROM_reg_n_5;
  wire ROM_reg_n_6;
  wire ROM_reg_n_7;
  wire [0:0]WEBWE;
  wire clk_IBUF_BUFG;
  wire [31:0]instruction_IBUF;
  wire [1:0]NLW_ROM_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_ROM_reg_DOPBDOP_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAAAAAAABEAAAAA)) 
    \CurrProgCounterOffset[0]_i_2 
       (.I0(Q[1]),
        .I1(ROM_reg_0[8]),
        .I2(ROM_DATA[31]),
        .I3(ROM_DATA[30]),
        .I4(ROM_DATA[28]),
        .I5(Q[2]),
        .O(\CurrState_reg[4]_0 ));
  LUT6 #(
    .INIT(64'h00000000AEAAAAAA)) 
    \CurrProgCounterOffset[7]_i_2 
       (.I0(Q[1]),
        .I1(ROM_DATA[31]),
        .I2(ROM_DATA[30]),
        .I3(ROM_DATA[28]),
        .I4(ROM_reg_0[8]),
        .I5(\CurrProgCounterOffset_reg[5] ),
        .O(\CurrState_reg[4] ));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \CurrProgCounter[7]_i_9 
       (.I0(\CurrState_reg[5]_0 ),
        .I1(ROM_DATA[30]),
        .I2(ROM_DATA[31]),
        .I3(\CurrProgCounter[7]_i_3 ),
        .I4(ROM_DATA[28]),
        .I5(ROM_reg_0[8]),
        .O(ROM_reg_4));
  LUT6 #(
    .INIT(64'h1011111111111111)) 
    \CurrState[0]_i_5 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(ROM_reg_0[8]),
        .I3(ROM_DATA[28]),
        .I4(ROM_DATA[31]),
        .I5(ROM_DATA[30]),
        .O(\CurrState_reg[6] ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAEA)) 
    \CurrState[2]_i_5 
       (.I0(\CurrState_reg[2] ),
        .I1(ROM_reg_0[8]),
        .I2(\CurrState_reg[2]_0 ),
        .I3(ROM_DATA[28]),
        .I4(ROM_DATA[30]),
        .I5(ROM_DATA[31]),
        .O(ROM_reg_2));
  LUT6 #(
    .INIT(64'hFBF8FAFB00000000)) 
    \CurrState[4]_i_3 
       (.I0(ROM_DATA[28]),
        .I1(ROM_reg_0[8]),
        .I2(Q[1]),
        .I3(ROM_DATA[30]),
        .I4(ROM_DATA[31]),
        .I5(\CurrState_reg[2]_0 ),
        .O(ROM_reg_5));
  LUT6 #(
    .INIT(64'hBABABBBABABAAABA)) 
    \CurrState[5]_i_2 
       (.I0(Q[2]),
        .I1(\CurrState_reg[5]_0 ),
        .I2(ROM_reg_0[8]),
        .I3(ROM_DATA[31]),
        .I4(ROM_DATA[30]),
        .I5(ROM_DATA[28]),
        .O(\CurrState_reg[5] ));
  LUT6 #(
    .INIT(64'hBABABABABBBABABA)) 
    \CurrState[6]_i_5 
       (.I0(\CurrState_reg[6]_0 ),
        .I1(\CurrState_reg[6]_1 ),
        .I2(ROM_DATA[30]),
        .I3(ROM_DATA[31]),
        .I4(ROM_reg_0[8]),
        .I5(ROM_DATA[28]),
        .O(ROM_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h0000F11C)) 
    \CurrState[7]_i_8 
       (.I0(ROM_reg_0[8]),
        .I1(ROM_DATA[28]),
        .I2(ROM_DATA[30]),
        .I3(ROM_DATA[31]),
        .I4(Q[1]),
        .O(ROM_reg_3));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d32" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d32" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "rom/ROM_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "31" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000200000001018000010080000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000300000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("SDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    ROM_reg
       (.ADDRARDADDR({1'b0,ADDRARDADDR,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,ADDRBWRADDR,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI(instruction_IBUF[15:0]),
        .DIBDI(instruction_IBUF[31:16]),
        .DIPADIP({1'b1,1'b1}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({ROM_reg_n_0,ROM_reg_n_1,ROM_reg_n_2,ROM_reg_n_3,ROM_reg_n_4,ROM_reg_n_5,ROM_reg_n_6,ROM_reg_n_7,ROM_reg_0[7:0]}),
        .DOBDO({ROM_DATA[31:30],ROM_reg_0[8],ROM_DATA[28],ROM_reg_n_20,ROM_reg_n_21,ROM_reg_n_22,ROM_reg_n_23,ROM_reg_n_24,ROM_reg_n_25,ROM_reg_n_26,ROM_reg_n_27,ROM_reg_n_28,ROM_reg_n_29,ROM_reg_n_30,ROM_reg_n_31}),
        .DOPADOP(NLW_ROM_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_ROM_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({WEBWE,WEBWE,WEBWE,WEBWE}));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h00400000)) 
    \count_reg[6]_i_7 
       (.I0(Q[1]),
        .I1(ROM_reg_0[8]),
        .I2(ROM_DATA[28]),
        .I3(ROM_DATA[30]),
        .I4(ROM_DATA[31]),
        .O(\CurrState_reg[4]_1 ));
endmodule

(* SIZE = "64" *) (* SIZE1 = "32" *) 
(* NotValidForBitStream *)
module toplevel
   (clk,
    rst_n,
    RX,
    TX,
    req,
    bus_interrupts_raise,
    bus_interrupts_ack,
    write,
    instruction_addr,
    instruction);
  input clk;
  input rst_n;
  input RX;
  output TX;
  input req;
  input bus_interrupts_raise;
  output bus_interrupts_ack;
  input write;
  input [7:0]instruction_addr;
  input [31:0]instruction;

  wire [6:1]CurrState;
  wire [7:0]ROM_ADDRESS;
  wire [29:0]ROM_DATA;
  wire TX;
  wire bus_interrupts_ack;
  wire bus_interrupts_ack_OBUF;
  wire bus_interrupts_raise;
  wire bus_interrupts_raise_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]instruction;
  wire [31:0]instruction_IBUF;
  wire [7:0]instruction_addr;
  wire [7:0]instruction_addr_IBUF;
  wire p_n_10;
  wire p_n_11;
  wire p_n_5;
  wire p_n_6;
  wire p_n_7;
  wire p_n_8;
  wire p_n_9;
  wire rom_n_10;
  wire rom_n_11;
  wire rom_n_12;
  wire rom_n_13;
  wire rom_n_14;
  wire rom_n_15;
  wire rom_n_16;
  wire rom_n_17;
  wire rom_n_18;
  wire rom_n_9;
  wire rst_n;
  wire rst_n_IBUF;
  wire write;
  wire write_IBUF;

initial begin
 $sdf_annotate("toplevel_tb_time_synth.sdf",,,,"tool_control");
end
  OBUF TX_OBUF_inst
       (.I(1'b1),
        .O(TX));
  OBUF bus_interrupts_ack_OBUF_inst
       (.I(bus_interrupts_ack_OBUF),
        .O(bus_interrupts_ack));
  IBUF bus_interrupts_raise_IBUF_inst
       (.I(bus_interrupts_raise),
        .O(bus_interrupts_raise_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \instruction_IBUF[0]_inst 
       (.I(instruction[0]),
        .O(instruction_IBUF[0]));
  IBUF \instruction_IBUF[10]_inst 
       (.I(instruction[10]),
        .O(instruction_IBUF[10]));
  IBUF \instruction_IBUF[11]_inst 
       (.I(instruction[11]),
        .O(instruction_IBUF[11]));
  IBUF \instruction_IBUF[12]_inst 
       (.I(instruction[12]),
        .O(instruction_IBUF[12]));
  IBUF \instruction_IBUF[13]_inst 
       (.I(instruction[13]),
        .O(instruction_IBUF[13]));
  IBUF \instruction_IBUF[14]_inst 
       (.I(instruction[14]),
        .O(instruction_IBUF[14]));
  IBUF \instruction_IBUF[15]_inst 
       (.I(instruction[15]),
        .O(instruction_IBUF[15]));
  IBUF \instruction_IBUF[16]_inst 
       (.I(instruction[16]),
        .O(instruction_IBUF[16]));
  IBUF \instruction_IBUF[17]_inst 
       (.I(instruction[17]),
        .O(instruction_IBUF[17]));
  IBUF \instruction_IBUF[18]_inst 
       (.I(instruction[18]),
        .O(instruction_IBUF[18]));
  IBUF \instruction_IBUF[19]_inst 
       (.I(instruction[19]),
        .O(instruction_IBUF[19]));
  IBUF \instruction_IBUF[1]_inst 
       (.I(instruction[1]),
        .O(instruction_IBUF[1]));
  IBUF \instruction_IBUF[20]_inst 
       (.I(instruction[20]),
        .O(instruction_IBUF[20]));
  IBUF \instruction_IBUF[21]_inst 
       (.I(instruction[21]),
        .O(instruction_IBUF[21]));
  IBUF \instruction_IBUF[22]_inst 
       (.I(instruction[22]),
        .O(instruction_IBUF[22]));
  IBUF \instruction_IBUF[23]_inst 
       (.I(instruction[23]),
        .O(instruction_IBUF[23]));
  IBUF \instruction_IBUF[24]_inst 
       (.I(instruction[24]),
        .O(instruction_IBUF[24]));
  IBUF \instruction_IBUF[25]_inst 
       (.I(instruction[25]),
        .O(instruction_IBUF[25]));
  IBUF \instruction_IBUF[26]_inst 
       (.I(instruction[26]),
        .O(instruction_IBUF[26]));
  IBUF \instruction_IBUF[27]_inst 
       (.I(instruction[27]),
        .O(instruction_IBUF[27]));
  IBUF \instruction_IBUF[28]_inst 
       (.I(instruction[28]),
        .O(instruction_IBUF[28]));
  IBUF \instruction_IBUF[29]_inst 
       (.I(instruction[29]),
        .O(instruction_IBUF[29]));
  IBUF \instruction_IBUF[2]_inst 
       (.I(instruction[2]),
        .O(instruction_IBUF[2]));
  IBUF \instruction_IBUF[30]_inst 
       (.I(instruction[30]),
        .O(instruction_IBUF[30]));
  IBUF \instruction_IBUF[31]_inst 
       (.I(instruction[31]),
        .O(instruction_IBUF[31]));
  IBUF \instruction_IBUF[3]_inst 
       (.I(instruction[3]),
        .O(instruction_IBUF[3]));
  IBUF \instruction_IBUF[4]_inst 
       (.I(instruction[4]),
        .O(instruction_IBUF[4]));
  IBUF \instruction_IBUF[5]_inst 
       (.I(instruction[5]),
        .O(instruction_IBUF[5]));
  IBUF \instruction_IBUF[6]_inst 
       (.I(instruction[6]),
        .O(instruction_IBUF[6]));
  IBUF \instruction_IBUF[7]_inst 
       (.I(instruction[7]),
        .O(instruction_IBUF[7]));
  IBUF \instruction_IBUF[8]_inst 
       (.I(instruction[8]),
        .O(instruction_IBUF[8]));
  IBUF \instruction_IBUF[9]_inst 
       (.I(instruction[9]),
        .O(instruction_IBUF[9]));
  IBUF \instruction_addr_IBUF[0]_inst 
       (.I(instruction_addr[0]),
        .O(instruction_addr_IBUF[0]));
  IBUF \instruction_addr_IBUF[1]_inst 
       (.I(instruction_addr[1]),
        .O(instruction_addr_IBUF[1]));
  IBUF \instruction_addr_IBUF[2]_inst 
       (.I(instruction_addr[2]),
        .O(instruction_addr_IBUF[2]));
  IBUF \instruction_addr_IBUF[3]_inst 
       (.I(instruction_addr[3]),
        .O(instruction_addr_IBUF[3]));
  IBUF \instruction_addr_IBUF[4]_inst 
       (.I(instruction_addr[4]),
        .O(instruction_addr_IBUF[4]));
  IBUF \instruction_addr_IBUF[5]_inst 
       (.I(instruction_addr[5]),
        .O(instruction_addr_IBUF[5]));
  IBUF \instruction_addr_IBUF[6]_inst 
       (.I(instruction_addr[6]),
        .O(instruction_addr_IBUF[6]));
  IBUF \instruction_addr_IBUF[7]_inst 
       (.I(instruction_addr[7]),
        .O(instruction_addr_IBUF[7]));
  cpu p
       (.ADDRARDADDR(ROM_ADDRESS),
        .\CurrProgCounterOffset_reg[0]_0 (rom_n_16),
        .\CurrProgCounterOffset_reg[1]_0 (rom_n_18),
        .\CurrProgCounterOffset_reg[5]_0 (rom_n_9),
        .\CurrProgCounter_reg[0]_0 (rom_n_13),
        .\CurrState_reg[0]_0 (rom_n_17),
        .\CurrState_reg[1]_0 (p_n_11),
        .\CurrState_reg[2]_0 (p_n_7),
        .\CurrState_reg[2]_1 (p_n_10),
        .\CurrState_reg[2]_2 (rom_n_11),
        .\CurrState_reg[4]_0 (rom_n_15),
        .\CurrState_reg[5]_0 (p_n_5),
        .\CurrState_reg[5]_1 (p_n_6),
        .\CurrState_reg[5]_2 (rom_n_14),
        .\CurrState_reg[6]_0 (p_n_8),
        .\CurrState_reg[6]_1 (rom_n_10),
        .\CurrState_reg[7]_0 (p_n_9),
        .\CurrState_reg[7]_1 (rom_n_12),
        .Q({CurrState[6:4],CurrState[1]}),
        .ROM_DATA({ROM_DATA[29],ROM_DATA[7:0]}),
        .bus_interrupts_ack_OBUF(bus_interrupts_ack_OBUF),
        .bus_interrupts_raise_IBUF(bus_interrupts_raise_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rst_n_IBUF(rst_n_IBUF));
  rom rom
       (.ADDRARDADDR(ROM_ADDRESS),
        .ADDRBWRADDR(instruction_addr_IBUF),
        .\CurrProgCounterOffset_reg[5] (p_n_6),
        .\CurrProgCounter[7]_i_3 (p_n_11),
        .\CurrState_reg[2] (p_n_10),
        .\CurrState_reg[2]_0 (p_n_5),
        .\CurrState_reg[4] (rom_n_9),
        .\CurrState_reg[4]_0 (rom_n_16),
        .\CurrState_reg[4]_1 (rom_n_18),
        .\CurrState_reg[5] (rom_n_14),
        .\CurrState_reg[5]_0 (p_n_9),
        .\CurrState_reg[6] (rom_n_17),
        .\CurrState_reg[6]_0 (p_n_8),
        .\CurrState_reg[6]_1 (p_n_7),
        .Q({CurrState[6:4],CurrState[1]}),
        .ROM_reg_0({ROM_DATA[29],ROM_DATA[7:0]}),
        .ROM_reg_1(rom_n_10),
        .ROM_reg_2(rom_n_11),
        .ROM_reg_3(rom_n_12),
        .ROM_reg_4(rom_n_13),
        .ROM_reg_5(rom_n_15),
        .WEBWE(write_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .instruction_IBUF(instruction_IBUF));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  IBUF write_IBUF_inst
       (.I(write),
        .O(write_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

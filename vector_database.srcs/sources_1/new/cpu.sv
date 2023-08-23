`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/12 23:24:00
// Design Name: 
// Module Name: Processor
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


module cpu #(parameter SIZE = 64, valence = 8, SIZE1 = 32, M=8)(
//Standard Signals
input  clk,
input  rst_n,
//BUS Signals
inout  [63:0] bus_data,
output  [7:0] bus_addr,
output  bus_we,
output  bus_re,
// ROM signals
output  [7:0] rom_address,
input  [SIZE1-1:0] rom_data,
// INTERRUPT signals
input  bus_interrupts_raise,
output  bus_interrupts_ack,
//pointer
output  shift,
output  mode


 );
//The main data bus is treated as tristate, so we need a mechanism to handle this.
//Tristate signals that interface with the main state machine
logic [63:0] busdatain;
logic [63:0] CurrBusDataOut, NextBusDataOut;
logic CurrBusDataOutWE, NextBusDataOutWE;
logic CurrBusDataOutRE, NextBusDataOutRE;
//

//Address of the bus
logic [7:0] CurrBusAddr, NextBusAddr;
assign bus_addr = CurrBusAddr;
//The processor has two internal registers to hold data between operations, and a third to hold
//the current program context when using function calls.
logic [SIZE-1:0] CurrRegA,CurrRegB;  //two inputs for alu
logic [3:0] opcode;
//logic [SIZE-1:0] CurrReg[15:0];    //normal calculation reg 64bits
//logic [SIZE-1:0] NextReg[15:0];
//logic [2*SIZE-1:0] CurrSupReg[15:0];   //specified for sup reg because they have 128bits
//logic [2*SIZE-1:0] NextSupReg[15:0];
logic [SIZE-1:0] next_temporeg,temporeg;
logic [3:0] CurrRegSelect, NextRegSelect;  
logic [3:0] CurrRegSelect1, NextRegSelect1;  
logic [3:0] CurrRegSelect2, NextRegSelect2;
logic [7:0] CurrProgContext, NextProgContext;
//Dedicated Interrupt output lines - one for each interrupt line
logic [1:0] CurrInterruptAck, NextInterruptAck;
assign bus_interrupts_ack = CurrInterruptAck;
//Instantiate program memory here
//There is a program counter which points to the current operation. The program counter
//has an offset that is used to reference information that is part of the current operation
logic [7:0] CurrProgCounter, NextProgCounter;
logic [8:0] CurrProgCounterOffset, NextProgCounterOffset;  //the length is not enough!!!
logic [SIZE1-1:0] ProgMemoryOut;
logic [7:0] Address_PLUS;
logic [7:0] ActualAddress;
assign ActualAddress = CurrProgCounter + CurrProgCounterOffset;
// ROM signals
assign rom_address = ActualAddress;
assign ProgMemoryOut = rom_data;
// DOT product
logic signed [valence-1:0] temp_reg1,temp_reg2,temp_reg3,temp_reg4;
logic [valence-1:0] temp_reg5,temp_reg6;
wire [valence-1:0]  temp_reg3_inv;
logic [6:0] count,next_count = 0;
//  count parameter for counting how many vector have been included.
logic [2:0] vector_count=0,next_vector_count;
//pointer shift
logic currshift,nextshift;
assign shift = currshift;
// mode used for computing long HVs.
logic currmode,next_mode;
assign mode = currmode;
//Tristate Mechanism
assign busdatain = bus_data;
assign bus_data = (CurrBusDataOutWE||currshift) ? CurrBusDataOut : 64'hZZZZZZZZZZZZZZZZ;
assign bus_we = CurrBusDataOutWE;
assign bus_re = CurrBusDataOutRE;
assign temp_reg3_inv = ~$unsigned(temp_reg3)+1;
//Instantiate the ALU
//The processor has an integrated ALU that can do several different operations
logic [SIZE-1:0] AluOut;
alu ALU0(
//standard signals
.CLK(clk),
.RESET(RESET),
//I/O
.IN_A(CurrRegA),
.IN_B(CurrRegB),
.ALU_Op_Code(opcode),
.OUT_RESULT(AluOut)
);
//The microprocessor is essentially a state machine, with one sequential pipeline
//of states for each operation.
//The current list of operations is:
// 0: Read from memory to A
// 1: Read from memory to B
// 2: Write to memory from A
// 3: Write to memory from B
// 4: Do maths with the ALU, and save result in reg A
// 5: Do maths with the ALU, and save result in reg B
// 6: if A (== or < or > B) GoTo ADDR
// 7: Goto ADDR
 // 8: Go to IDLE
// 9: End thread, goto idle state and wait for interrupt.
 // 10: Function call
 // 11: Return from function call
 // 12: Dereference A
 //13: Dereference B
parameter Max = SIZE/valence;
parameter signed Scale=0.25;
enum{ //Program thread selection

//Operation selection
 //Depending on the value of ProgMemOut, goto one of the instruction start states.
 
CHOOSE_OPP = 8'h00,
// Addition
ADD_1 = 8'h10,
ADD_2 = 8'h11,
ADD_3 = 8'h12,
ADD_4 = 8'h13,
ADD_5 = 8'h14,
ADD_6 = 8'h15,
ADD_S1 = 8'h16,
ADD_S2 = 8'h17,
ADD_S3 = 8'h18,
ADD_S4 = 8'h19,
ADD_S5 = 8'h1A,
//MOVE_L
MOVE_L1 = 8'h20,
MOVE_L2 = 8'h21,
MOVE_L3 = 8'h22,
MOVE_L4 = 8'h23,
//IDLE
IDLE_1 = 8'h24,
GET_THREAD_START_ADDR_0 = 8'h25,
GET_THREAD_START_ADDR_1 = 8'h26,
GET_THREAD_START_ADDR_2 = 8'h27,
Branch_1 = 8'h28,
Branch_2 = 8'h29,
Branch_3 = 8'h2a,
Branch_4 = 8'h2b,
Branch_5 = 8'h2c,
Jump = 8'h2d,
Replace_L1 = 8'h30,
Replace_L2 = 8'h31,
Replace_L3 = 8'h32,
Replace_L4 = 8'h33,
Replace_L5 = 8'h34,
/*
Complete the above parameter list for In/Equality, Goto Address, Goto Idle, function start, Return from
function, and Dereference operations.
*/
//MAN_L
MAN_L1 = 8'h40,
MAN_L2 = 8'h41,
MAN_L3 = 8'h42,
MAN_L4 = 8'h43,
MAN_L5 = 8'h44,
MAN_L6 = 8'h45,
MAN_L7 = 8'h46,
//replace with an immediate 
Replace_1 = 8'h50,
Replace_2 = 8'h51,
Replace_3 = 8'h52,
Replace_4 = 8'h53,
//pointer
 Pointer_1 = 8'h60,
 //ADD_L
 ADD_L1 = 8'h70,
 ADD_L2 = 8'h71,
 ADD_L3 = 8'h72,
 ADD_L4 = 8'h73,
 ADD_L5 = 8'h74,
 ADD_L6 = 8'h75,
 ADD_L7 = 8'h76,
 //DOT_L
 DOT_L1 = 8'h80,
 DOT_L2 = 8'h81,
 DOT_L3 = 8'h82,
 DOT_L4 = 8'h83,
 DOT_L5 = 8'h84,
 DOT_L6 = 8'h85,
 DOT_L7 = 8'h86,
 //Move data
 MOVE_1 = 8'h90,
 MOVE_2 = 8'h91,
 MOVE_3 = 8'h92,
 
 //SUP
 SUP_1 = 8'hA0,
 SUP_2 = 8'hA1,
 SUP_3 = 8'hA2,
 SUP_4 = 8'hA3,
 //DOT
 DOT_1 = 8'hB0,
 DOT_2 = 8'hB1,
 DOT_3 = 8'hB2,
 DOT_4 = 8'hB3,
 DOT_5 = 8'hB4,
 DOT_6 = 8'hB5,
 //MAN
 MAN_1 = 8'hC0,
 MAN_2 = 8'hC1,
 MAN_3 = 8'hC2,
 MAN_4 = 8'hC3,
 MAN_5 = 8'hC4,
 MAN_6 = 8'hC5,
 //Pointer_L
 Pointer_L1 = 8'hD0,
 //INV
 Inv_1 = 8'hD1,
 Inv_2 = 8'hD2,
 Inv_3 = 8'hD3,
 Inv_4 = 8'hD4,
 Inv_5 = 8'hD5,
 HAM_1 = 8'hE0,
 HAM_2 = 8'hE1,
 HAM_3 = 8'hE2,
 HAM_4 = 8'hE3,
 HAM_5 = 8'hE4,
 Tan_1 = 8'hF0,
 Tan_2 = 8'hF1,
 Tan_3 = 8'hF2,
 Tan_4 = 8'hF3,
 Tan_5 = 8'hF4,
 Tan_6 = 8'hF5,
 Tan_7 = 8'hF6,
 Tan_8 = 8'hF7} State;
//Sequential part of the State Machine.
logic [7:0] CurrState, NextState;
//test

always_ff@(posedge clk) begin
    if(!rst_n) begin
        CurrState = 8'h00;
        CurrProgCounter = 8'h00;
        CurrProgCounterOffset = 2'h0;
        CurrBusAddr = 8'hFF; //Initial instruction after reset.
        CurrBusDataOut = 0;
        CurrBusDataOutWE = 1'b0;
        CurrBusDataOutRE = 1'b0;
  /*      for (int i=0; i<16;i++) begin
        CurrReg[i] = 0; 
        end
        for (int i=0; i<16;i++) begin
        CurrSupReg[i] = 0; 
        end    */
        CurrRegSelect = 4'b0;
        CurrRegSelect1 = 4'b0;
        CurrRegSelect2 = 4'b0;
        CurrProgContext = 8'h00;
        CurrInterruptAck = 2'b00;
        vector_count = 0;
        count = 0;
        currshift = 1'b0;
        temporeg = 0;
        currmode = 0;
    end else begin
        CurrState = NextState;
        CurrProgCounter = NextProgCounter;
        CurrProgCounterOffset = NextProgCounterOffset;
        CurrBusAddr = NextBusAddr;
        CurrBusDataOut = NextBusDataOut;
        CurrBusDataOutWE = NextBusDataOutWE;
        CurrBusDataOutRE = NextBusDataOutRE;
   /*     for (int i=0; i<16;i++) begin
        CurrReg[i] = NextReg[i]; 
        end
        for (int i=0; i<16;i++) begin
        CurrSupReg[i] = NextSupReg[i]; 
        end   */
        CurrRegSelect = NextRegSelect;
        CurrRegSelect1 = NextRegSelect1;
        CurrRegSelect2 = NextRegSelect2;
        CurrProgContext = NextProgContext;
        CurrInterruptAck = NextInterruptAck;
        currshift = nextshift;
        currmode = next_mode;
        temporeg = next_temporeg;
        vector_count = next_vector_count;
        count = next_count;
    end
end
//Combinatorial section - large!
always_comb begin
//Generic assignment to reduce the complexity of the rest of the S/M
    NextState = CurrState;
    NextProgCounter = CurrProgCounter;
    NextProgCounterOffset = 2'h0;   //this means you have only a small time to get the data memory
    nextshift = 1'b0;
    NextBusAddr = 8'hFF;
    NextBusDataOut = CurrBusDataOut;
    NextBusDataOutWE = 1'b0;
    NextBusDataOutRE = 1'b0;
 /*     for (int i=0; i<16;i++) begin
        NextReg[i] = CurrReg[i]; 
        end
      for (int i=0; i<16;i++) begin
        NextSupReg[i] = CurrSupReg[i]; 
        end  */
    NextRegSelect = CurrRegSelect;
    NextRegSelect1 = CurrRegSelect1;
    NextRegSelect2 = CurrRegSelect2;
    NextProgContext = CurrProgContext;
    NextInterruptAck = 2'b00;
    next_mode = currmode;
    next_temporeg = temporeg;
    next_vector_count = vector_count;
    next_count = count;
//Case statement to describe each state
    case (CurrState)
///////////////////////////////////////////////////////////////////////////////////////
//Thread states.
    IDLE_1: begin
     if(bus_interrupts_raise) begin // Interrupt Request A.
        NextState = GET_THREAD_START_ADDR_0;
        NextProgCounter = 8'hFF;
       NextInterruptAck = 2'b01;
    
     end else begin
        NextState = IDLE_1;
        NextProgCounter = 8'hFF; //Nothing has happened.
        NextInterruptAck = 2'b00;
     end
    end
//Wait state - for new prog address to arrive.
   GET_THREAD_START_ADDR_0: begin
        NextState = GET_THREAD_START_ADDR_1;
    end
//Assign the new program counter value
    GET_THREAD_START_ADDR_1: begin
        NextState = GET_THREAD_START_ADDR_2;
        NextProgCounter = ProgMemoryOut[0+:8];
    end
//Wait for the new program counter value to settle
    GET_THREAD_START_ADDR_2:
        NextState = CHOOSE_OPP;  
///////////////////////////////////////////////////////////////////////////////////////
//CHOOSE_OPP - Another case statement to choose which operation to perform
    CHOOSE_OPP: begin
         case (ProgMemoryOut[SIZE1-1-:4])    //28 bits for instructions
         //    4'h0: NextState = READ_FROM_MEM;             //done
         //    4'h1: NextState = WRITE_TO_MEM;    //done
         
         
      /*      4'h2: begin    //done
                NextState = DO_MATHS_OPP_SAVE;
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
                NextRegSelect2 = ProgMemoryOut[7:4];  
             end */
     /*        4'h3: begin 
                NextState = IF_A_EQUALITY_B_GOTO;  //done
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8]; 
             end  */
             4'h0: begin
                if(ProgMemoryOut[0]) begin
                    NextState = ADD_S1;  //done1
                  
                end else begin
                    NextState = ADD_1;  //done1
               
                end
                 NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                 NextBusDataOutRE = 1'b1;
             end
        //     4'h5: NextState = IDLE;
      //       4'h6: NextState = FUNCTION_START;
       //      4'h7: NextState = RETURN;

             
             4'h1: begin   //done1   verified 
                NextState = MOVE_1; 
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
             end
             4'h2: begin   //verified
                if(ProgMemoryOut[0])  begin
                    NextState = Jump;
                    NextProgCounter = ProgMemoryOut[SIZE1-21-:8];
               end  else if(ProgMemoryOut[1]) begin
                    NextState = Branch_1;
                    NextBusAddr = ProgMemoryOut[SIZE1-5-:8]; 
                    NextBusDataOutRE = 1'b1; 
                end else  NextState = IDLE_1;
             end
             4'h3: begin     //done  1
                NextState = DOT_1;
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8]; 
                NextBusDataOutRE = 1'b1;             
             end
             4'h4: begin
                NextState = MAN_1;  //done1
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];  //source address1
                NextBusDataOutRE = 1'b1;
                next_temporeg = 0;  
             end   
             4'h5: begin    //1
                NextState = Replace_1;
               // TempoReg[SIZE-1-:4] =  ProgMemoryOut[3:0];
                NextProgCounterOffset = 1;
               
             end
             4'h6: begin   //done but make sure u change the code in stack1
                NextState = Pointer_1;
                NextProgCounter = CurrProgCounter + 1;
               
             end
             4'h7: begin
                NextState = ADD_L1; //1
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
                next_mode = 1;
             end
             4'h8: begin  //1
                NextState = DOT_L1;
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
             end
             4'h9: begin  //1
                NextState = MOVE_L1;
                if(vector_count==0)
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8]; 
                else if(ProgMemoryOut[SIZE1-5-:8] < 8'h7F)    NextBusAddr = ProgMemoryOut[SIZE1-5-:8]+vector_count;
                NextBusDataOutRE = 1'b1;
             end
             4'hA: begin //1
                NextState = MAN_L1;
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];  //source address1
                next_temporeg = 0;
                NextBusDataOutRE = 1'b1;
             end
             4'hB: begin
                NextState = Replace_L1;
                next_count = count + 1;
                NextProgCounterOffset = count+1;  //1 3
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];               
             end
             4'hC: begin
                NextState = Pointer_L1;
                next_mode = 1;
             end
             4'hD: begin      
                NextState = Inv_1;   //done check on 8.9
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
             end 
             4'hE: begin
                NextState = HAM_1;
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
                next_temporeg = 0;
             end
             4'hF: begin       
                NextState = Tan_1;
                NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
                NextBusDataOutRE = 1'b1;
                next_temporeg = 0;
             end
             default:
             NextState = CurrState;
        endcase
     
    end
///////////////////////////////////////////////////////////////////////////////////////
   ADD_S1: begin
        NextState = ADD_S2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];  
        NextBusDataOutRE = 1'b1;
   end
   ADD_S2: begin
        NextState = ADD_S3;
        CurrRegA = busdatain;  
   end
   ADD_S3: begin
       NextState = ADD_S4;
       CurrRegB = busdatain; 
   end
   ADD_S4: begin
       NextState =ADD_S5;
       next_temporeg = CurrRegA+CurrRegB;
       NextProgCounter = CurrProgCounter + 1;
   end
   ADD_S5:begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];//destination address
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;  
   end
   Jump: begin
       NextState = CHOOSE_OPP;
   end
//Branch to
   Branch_1: begin
       NextState = Branch_2;
       NextBusAddr = ProgMemoryOut[SIZE1-13-:8];  
       NextBusDataOutRE = 1'b1;
   end
   Branch_2: begin
        NextState = Branch_3;
        CurrRegA = busdatain;        
   end
   Branch_3: begin
        NextState = Branch_4;
        CurrRegB = busdatain;
   end
   Branch_4: begin
        NextState = Branch_5;
        case(ProgMemoryOut[3:2])
            2'b00: begin
                if(CurrRegA == CurrRegB)
                   NextProgCounter = ProgMemoryOut[SIZE1-21-:8];
                else 
                   NextProgCounter = CurrProgCounter + 1;
            end
            2'b01: begin
                if(CurrRegA > CurrRegB)
                   NextProgCounter = ProgMemoryOut[SIZE1-21-:8];
                else 
                   NextProgCounter = CurrProgCounter + 1;
            end
            2'b10:begin
                if(CurrRegA < CurrRegB)
                   NextProgCounter = ProgMemoryOut[SIZE1-21-:8];
               else 
                   NextProgCounter = CurrProgCounter + 1;
            end
        endcase
   end
   Branch_5:begin
        NextState = CHOOSE_OPP;
   end
//Tanimoto distance
    Tan_1: begin
        NextState = Tan_2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];  
        NextBusDataOutRE = 1'b1;        
    end
    Tan_2: begin
        NextState = Tan_3;
        CurrRegA = busdatain;
    end
    Tan_3: begin
        NextState = Tan_4;
        CurrRegB = busdatain;
    end
    Tan_4: begin
        NextState = Tan_5;
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];
       // temp_reg3 = temp_reg1 * temp_reg2;
        temp_reg5 = 0;
        temp_reg6 = 0;
    end
    Tan_5: begin
        NextState = Tan_6;
         for (int i = 0; i < valence; i = i + 1) begin
         if (temp_reg1[i]&temp_reg2[i]) begin
            temp_reg5 = temp_reg5 + 1;
            end
        end
         for (int i = 0; i < valence; i = i + 1) begin
         if (temp_reg1[i]|temp_reg2[i]) begin
            temp_reg6 = temp_reg6 + 1;
            end
        end
      next_temporeg = ($signed(2)**(valence-1)*temp_reg6-$signed(2)**(valence-1)*temp_reg5)/temp_reg6 + temporeg;
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = Tan_4;
           
        end
        else begin
            next_count = 0;
            NextState = Tan_6;
            NextProgCounter = CurrProgCounter + 1;
        end        
    end
   
   
    Tan_6: begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];//destination address
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;        
    end
  /*  Tan_7: begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];//destination address
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;         
    end*/
//HAMMING DISTANCE
    HAM_1: begin
        NextState = HAM_2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];  
        NextBusDataOutRE = 1'b1;
    end
    HAM_2: begin
        NextState = HAM_3;
        CurrRegA = busdatain;           
    end
    HAM_3: begin
        NextState = HAM_4;
        CurrRegB = busdatain;        
    end
    HAM_4: begin
        NextState = HAM_5;
        NextProgCounter = CurrProgCounter + 1;
       // TempoReg = CurrRegA ^ CurrRegB;    
        for (int i = 0; i < SIZE; i = i + 1) begin
         if (CurrRegA[i]^CurrRegB[i]) begin
            next_temporeg = next_temporeg + 1;
         end
        end
    end
    HAM_5: begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];//destination address
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;        

    end
//Sign inverse 
    Inv_1: begin    //done
        NextState = Inv_2;
    end
    Inv_2: begin
        CurrRegA = busdatain;     
        NextState = Inv_3;
    end
    Inv_3: begin
        temp_reg1 = CurrRegA[count+:valence];
        NextState = Inv_4;
    end
    Inv_4: begin
        next_temporeg[count+:valence] = ~temp_reg1 + 1;
          if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = Inv_3;
        end
        else begin  
            next_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = Inv_5;
        end    
    end
    Inv_5: begin
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;    
    end
//Pointer_L
    Pointer_L1: begin
        NextState = CHOOSE_OPP;
        nextshift = 1;
        NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
        NextBusDataOut = {(SIZE-6)*{1'b0},ProgMemoryOut[SIZE1-13-:6]};        
    end
//Replace_L
    Replace_L1: begin
        NextState = Replace_L2;
        next_count = count + 1;
        NextProgCounterOffset = count + 1; //2
    end
    Replace_L2: begin
        NextState = Replace_L3;
        next_temporeg[0+:SIZE1] = ProgMemoryOut;
    end
    Replace_L3: begin
        NextState = Replace_L4;
        next_temporeg[SIZE1+:SIZE1] = ProgMemoryOut;
    end
    Replace_L4: begin
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;
        
        if(vector_count < (M-1)) begin
            next_vector_count = vector_count + 1;
            NextState = CHOOSE_OPP;
        end
        else begin
            next_vector_count = 0;
            next_count = 0;
            NextProgCounter = CurrProgCounter + 17;
            NextState = Replace_L5;
        end        
        //perhaps add pointer ID;        
    end
    Replace_L5: begin
        NextState = CHOOSE_OPP;
    end
//MAN_L
    MAN_L1: begin
        NextState = MAN_L2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8]; 
        NextBusDataOutRE = 1'b1;
    end
    MAN_L2: begin
        NextState = MAN_L3;
        CurrRegA = busdatain;
    end
    MAN_L3: begin
        NextState = MAN_L4;
        CurrRegB = busdatain;
    end
    MAN_L4: begin
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];
        NextState = MAN_L5;
    end
    MAN_L5: begin
        if(temp_reg1 >= temp_reg2) 
           next_temporeg = temporeg + temp_reg1 - temp_reg2;
        else    next_temporeg = temporeg + temp_reg2 - temp_reg1;
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = MAN_L4;
        end
        else begin
            next_count = 0;
            NextState = MAN_L6;
        end    
    end
    MAN_L6: begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        if(vector_count < (M-1)) begin
            next_vector_count = vector_count + 1;
            NextState = CHOOSE_OPP;
        end
        else begin
            next_vector_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = MAN_L7;
        end
    end
    MAN_L7: begin
        NextState = CHOOSE_OPP;
    end   
//MOVE_L
    MOVE_L1: begin
        NextState = MOVE_L2;
      //  NextBusDataOut =1'bZ;
    //    NextBusDataOutWE = 1'b1;
    end
    MOVE_L2: begin
        NextState = MOVE_L3;
        next_temporeg = busdatain;
    end
    MOVE_L3: begin
        NextBusDataOut =temporeg;
        if(ProgMemoryOut[SIZE1-13-:8]< 8'h7F)
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8]+vector_count;
        else NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextBusDataOutWE = 1'b1;
        if(vector_count < (M-1)) begin
            next_vector_count = vector_count + 1;
            NextState = CHOOSE_OPP;
        end
        else begin
            next_vector_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = MOVE_L4;
        end
    end
    MOVE_L4: begin
        NextState = CHOOSE_OPP;
    end
//DOT_L
    DOT_L1: begin
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextState = DOT_L2;
        NextBusDataOutRE = 1'b1;
    end
    DOT_L2: begin
        NextState = DOT_L3;
        CurrRegA = busdatain;
    end
    DOT_L3: begin
        NextState = DOT_L4;
        CurrRegB = busdatain;       
    end
    DOT_L4: begin
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];
        NextState = DOT_L5;
    end    
    DOT_L5: begin
        if(temp_reg1*temp_reg2 >= $signed(2**(valence-1)-1) )
        next_temporeg[count+:valence] =  $signed(2**(valence-1)-1);
        else if(temp_reg1*temp_reg2 <= -($signed(2) ** (valence-1)))
        next_temporeg[count+:valence] =  -($signed(2) ** (valence-1));
        else
        next_temporeg[count+:valence] =  temp_reg1*temp_reg2;
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = DOT_L4;
        end
        else begin
            next_count = 0;
            
            NextState = DOT_L6;
        end    
        
    end
    DOT_L6: begin   
      //  NextState = CHOOSE_OPP;
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8]; 
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;      
        if(vector_count < M-1) begin
            NextState = CHOOSE_OPP;
            next_vector_count = vector_count + 1;
        end
        else begin 
            NextState = DOT_L7;
            NextProgCounter = CurrProgCounter + 1;
            next_mode = 0;
            next_vector_count = 0; 
        end  
    end    
    DOT_L7: begin
        NextState = CHOOSE_OPP;
    end
//ADD_L1
    ADD_L1 : begin
        NextState = ADD_L2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];     
        NextBusDataOutRE = 1'b1;   
    end
    ADD_L2 : begin
        NextState = ADD_L3;
        CurrRegA = busdatain;       
    end
    ADD_L3: begin
        NextState = ADD_L4;
        CurrRegB = busdatain;
    end
    ADD_L4: begin
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];
         next_temporeg[count+:valence] = temp_reg1 + temp_reg2;
        NextState = ADD_L5;
    end
    ADD_L5: begin
       if(~(temp_reg1[valence-1]^temp_reg2[valence-1])&(temp_reg1[valence-1]^temporeg[count+valence-1])) begin   //avoid overflow
            if(temp_reg1[valence-1]==0) begin
                for(int i= 0; i<(valence-1); i=i+1) begin
                    next_temporeg[count+i] = 1;
           
                end
                next_temporeg[count+valence-1] = 1'b0;
            end else begin
                for(int i= 0; i<(valence-1); i=i+1) begin
                    next_temporeg[count+i] = 0;
                end
                next_temporeg[count+valence-1] = 1'b1;
            end
            
            
       end
            
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = ADD_L4;
        end
        else begin
            next_count = 0;
            
            NextState = ADD_L6;
        end    
    end
    ADD_L6: begin
        
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8]; 
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;
        if(vector_count < M-1) begin
            NextState = CHOOSE_OPP;
            next_vector_count = vector_count + 1;
        end
        else begin 
            NextState = ADD_L7;
            NextProgCounter = CurrProgCounter + 1;
            next_mode = 0;
            next_vector_count = 0;
        end
    end    
    ADD_L7: begin
        NextState = CHOOSE_OPP;
    end
//ADD
    ADD_1: begin
        NextState = ADD_2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextBusDataOutRE = 1'b1;
    end
    ADD_2: begin
        NextState = ADD_3;
        CurrRegA = busdatain;
    end
    ADD_3: begin
        NextState = ADD_4;
        CurrRegB = busdatain;
    end
    ADD_4: begin
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];
        NextState = ADD_5;
    end
    ADD_5: begin
        next_temporeg[count+:valence] = temp_reg1 + temp_reg2;
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = ADD_4;
        end
        else begin
            next_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = ADD_6;
        end    
    end
    ADD_6: begin
        NextState = CHOOSE_OPP;
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8]; 
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;
    end
//Pointer
    Pointer_1: begin
         NextState = CHOOSE_OPP;
         nextshift = 1;
         NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
         NextBusDataOut = {(SIZE-6)*{1'b0},ProgMemoryOut[SIZE1-13-:6]};
    end
//Replace_1
    Replace_1: begin
        NextState = Replace_2;
        NextProgCounterOffset = 2;
    end
    Replace_2: begin
        NextState = Replace_3;
        next_temporeg[0+:SIZE1] = ProgMemoryOut;
    end
    Replace_3: begin
        NextState = Replace_4;
        next_temporeg[SIZE1+:SIZE1] = ProgMemoryOut;
        NextProgCounter = CurrProgCounter + 3;
    end
 
    Replace_4: begin
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;
        NextState = CHOOSE_OPP;
        NextBusAddr = ProgMemoryOut[SIZE1-5-:8];
        //perhaps add pointer ID;        
    end
// MANHattun distance
    MAN_1: begin
        NextState = MAN_2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];  
        NextBusDataOutRE = 1'b1;
    end
    MAN_2: begin
        NextState = MAN_3;
        CurrRegA = busdatain;       
    end
    MAN_3: begin
        NextState = MAN_4;
        CurrRegB = busdatain;        

    end
    MAN_4: begin
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence]; 
        temp_reg3 = temp_reg1-temp_reg2;
        NextState = MAN_5;
    end
    MAN_5: begin
        if((temp_reg1[valence-1]^temp_reg2[valence-1])&(temp_reg1[valence-1]^temp_reg3[valence-1])) begin   //avoid overflow
            if(temp_reg1[valence-1]==0 )   begin
             for(int i= 0; i<valence-1; i=i+1) begin
                temp_reg3[i] = 1;
           
                end
                temp_reg3[valence-1] = 1'b0;
            end else begin
             for(int i= 0; i<valence-1; i=i+1) begin
                temp_reg3[i] = 0;
           
                end
                temp_reg3[valence-1] = 1'b1;
            end
        end
        //compute absolute
        if(temp_reg3[valence-1]==1)      //negative
        next_temporeg = temporeg + temp_reg3_inv;
        else  next_temporeg = temporeg + temp_reg3;
        
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = MAN_4;
        end
        else begin  
            next_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = MAN_6;
        end    
    end

    MAN_6: begin
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8];
        NextBusDataOutWE = 1'b1;
        NextBusDataOut =temporeg;
        NextState = CHOOSE_OPP;
    end
//DOT product
    DOT_1: begin
       // temp_reg1 = CurrReg[CurrRegSelect][count+:valence];
       // temp_reg2 = CurrReg[CurrRegSelect][count+:valence];
        NextState = DOT_2;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextBusDataOutRE = 1'b1;
    end
    DOT_2: begin
        NextState = DOT_3;
        CurrRegA = busdatain;
    end
    DOT_3: begin
        NextState = DOT_4;
        CurrRegB = busdatain;       
    end
    DOT_4: begin
        NextState = DOT_5;
        temp_reg1 = CurrRegA[count+:valence];
        temp_reg2 = CurrRegB[count+:valence];        
    end
    DOT_5: begin
        if(temp_reg1*temp_reg2 >= $signed(2**(valence-1)-1) )
        next_temporeg[count+:valence] =  $signed(2**(valence-1)-1);
        else if(temp_reg1*temp_reg2 <= -($signed(2) ** (valence-1)))
        next_temporeg[count+:valence] =  -($signed(2) ** (valence-1));
        else
        next_temporeg[count+:valence] =  temp_reg1*temp_reg2;
        if(count < SIZE-valence) begin
            next_count = count + valence;
            NextState = DOT_4;
        end
        else begin
            next_count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = DOT_6;
        end    
        
    end
    DOT_6: begin   
        NextState = CHOOSE_OPP;
        NextBusAddr = ProgMemoryOut[SIZE1-21-:8]; 
        NextBusDataOut = temporeg;
        NextBusDataOutWE = 1'b1;        
    end
//Superposition operation
 /*   SUP_1: begin
        NextSupReg[CurrRegSelect2] = {CurrReg[CurrRegSelect],CurrReg[CurrRegSelect1]};
        NextState = SUP_2;
        NextProgCounter = CurrProgCounter + 1;
    end
    SUP_2: begin
        NextState = CHOOSE_OPP;
    end  */
// MOVE operation
    MOVE_1: begin
        NextState = MOVE_2;
    //    NextBusDataOut ={SIZE{1'bZ}};
  //      NextBusDataOutWE = 1'b1;
    end
    MOVE_2: begin
        NextState = MOVE_3;
        next_temporeg = busdatain;
        NextProgCounter = CurrProgCounter + 1;
    end

    MOVE_3: begin
        NextState = CHOOSE_OPP;  //read from the address2
        NextBusDataOut =temporeg;
        NextBusAddr = ProgMemoryOut[SIZE1-13-:8];
        NextBusDataOutWE = 1'b1;
    end
  /*  DO_MATHS_OPP_SAVE: begin
        NextState = DO_MATHS_OPP_0;
        NextProgCounter = CurrProgCounter + 1;
        CurrRegA = CurrReg[CurrRegSelect];
        CurrRegB = CurrReg[CurrRegSelect1];
        opcode = ProgMemoryOut[3:0];
    end
    DO_MATHS_OPP_0: begin
        NextState = CHOOSE_OPP;
        NextReg[CurrRegSelect2] = AluOut;
        
    end*/


///////////////////////////////////////////////////////////////////////////////////////
//WRITE_TO_MEM_FROM_A : here starts the memory write operational pipeline.
//Wait state - to find the address of where we are writing
//Increment the program counter here. This must be done 2 clock cycles ahead
 //so that it presents the right data when required.

//WRITE_TO_MEM_FROM_B : here starts the memory write operational pipeline.
//Wait state - to find the address of where we are writing
//Increment the program counter here. This must be done 2 clock cycles ahead
 // so that it presents the right data when required.


 

//The address will be valid during this state, so set the BUS_ADDR to this value,
//and write the value to the memory location.
 
 ///////////////////////////////////////////////////////////////////////////////////////
 //DO_MATHS_OPP_SAVE_IN_A : here starts the DoMaths operational pipeline.
  //Reg A and Reg B must already be set to the desired values. The MSBs of the
 // Operation type determines the maths operation type. At this stage the result is
  // ready to be collected from the ALU.

 //DO_MATHS_OPP_SAVE_IN_B : here starts the DoMaths operational pipeline
  //when the result will go into reg B.

 //Wait state for new prog address to settle.
    
 /*
 Complete the above case statement for In/Equality, Goto Address, Goto Idle, function start, Return from
 function, and Dereference operations.
 */
    //GOTO

    //DE_REFERENCE  

  
    
 endcase
 end
 endmodule
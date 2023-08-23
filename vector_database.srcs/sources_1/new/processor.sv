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


module processor #(parameter SIZE = 64, valence = 2 , Max=SIZE/valence)(
//Standard Signals
input logic CLK,
input logic RESET,
//BUS Signals
inout logic [63:0] BUS_DATA,
output logic [7:0] BUS_ADDR,
output logic BUS_WE,
// ROM signals
output logic [7:0] ROM_ADDRESS,
input logic [19:0] ROM_DATA,
// INTERRUPT signals
input logic [1:0] BUS_INTERRUPTS_RAISE,
output logic [1:0] BUS_INTERRUPTS_ACK
//test

 );
//The main data bus is treated as tristate, so we need a mechanism to handle this.
//Tristate signals that interface with the main state machine
logic [63:0] BusDataIn;
logic [63:0] CurrBusDataOut, NextBusDataOut;
logic CurrBusDataOutWE, NextBusDataOutWE;
//Tristate Mechanism
assign BusDataIn = BUS_DATA;
assign BUS_DATA = CurrBusDataOutWE ? CurrBusDataOut : 64'hZZZZZZZZZZZZZZZZ;
assign BUS_WE = CurrBusDataOutWE;
//Address of the bus
logic [7:0] CurrBusAddr, NextBusAddr;
assign BUS_ADDR = CurrBusAddr;
//The processor has two internal registers to hold data between operations, and a third to hold
//the current program context when using function calls.
logic [SIZE-1:0] CurrRegA,CurrRegB;  //two inputs for alu
logic [3:0] opcode;
logic [SIZE-1:0] CurrReg[15:0];    //normal calculation reg 64bits
logic [SIZE-1:0] NextReg[15:0];
logic [2*SIZE-1:0] CurrSupReg[15:0];   //specified for sup reg because they have 128bits
logic [2*SIZE-1:0] NextSupReg[15:0];
logic [SIZE-1:0] TempoReg;
logic [3:0] CurrRegSelect, NextRegSelect;  
logic [3:0] CurrRegSelect1, NextRegSelect1;  
logic [3:0] CurrRegSelect2, NextRegSelect2;
logic [7:0] CurrProgContext, NextProgContext;
//Dedicated Interrupt output lines - one for each interrupt line
logic [1:0] CurrInterruptAck, NextInterruptAck;
assign BUS_INTERRUPTS_ACK = CurrInterruptAck;
//Instantiate program memory here
//There is a program counter which points to the current operation. The program counter
//has an offset that is used to reference information that is part of the current operation
logic [7:0] CurrProgCounter, NextProgCounter;
logic [1:0] CurrProgCounterOffset, NextProgCounterOffset;
logic [19:0] ProgMemoryOut;
logic [7:0] Address_PLUS;
logic [7:0] ActualAddress;
assign ActualAddress = CurrProgCounter + CurrProgCounterOffset;
// ROM signals
assign ROM_ADDRESS = ActualAddress;
assign ProgMemoryOut = ROM_DATA;
// DOT product
logic [valence-1:0] temp_reg1,temp_reg2;
logic [6:0] count = 0;
//Instantiate the ALU
//The processor has an integrated ALU that can do several different operations
logic [SIZE-1:0] AluOut;
alu ALU0(
//standard signals
.CLK(CLK),
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
parameter [7:0] //Program thread selection
IDLE = 8'hF0, //Waits here until an interrupt wakes up the processor.
GET_THREAD_START_ADDR_0 = 8'hF1, //Wait.
GET_THREAD_START_ADDR_1 = 8'hF2, //Apply the new address to the program counter.
GET_THREAD_START_ADDR_2 = 8'hF3, //Wait. Goto ChooseOp.
//Operation selection
 //Depending on the value of ProgMemOut, goto one of the instruction start states.
CHOOSE_OPP = 8'h00,
//Data Flow
READ_FROM_MEM = 8'h10, //Wait to find what address to read, save reg select.
READ_FROM_MEM_0 = 8'h12, //Set BUS_ADDR to designated address.
READ_FROM_MEM_1 = 8'h13, //wait - Increments program counter by 2. Reset offset.
READ_FROM_MEM_2 = 8'h14, //Writes memory output to chosen register, end op.
WRITE_TO_MEM = 8'h20, //Reads Op+1 to find what address to Write to.

WRITE_TO_MEM_0 = 8'h22, //wait - Increments program counter by 2. Reset offset.
//Binding
Binding_0 = 8'h23,
Binding_1 = 8'h24,
//Data Manipulation
DO_MATHS_OPP_SAVE = 8'h30, //The result of maths op. is available, save it to Reg A.

DO_MATHS_OPP_0 = 8'h31, //wait for new op address to settle. end op.
/*
Complete the above parameter list for In/Equality, Goto Address, Goto Idle, function start, Return from
function, and Dereference operations.
*/
//Condition jump 
 IF_A_EQUALITY_B_GOTO= 8'h40,
 JUMP_ADDR = 8'h41,
 JUMP_ADDR_0 = 8'h42,
 JUMP_ADDR_1 = 8'h43,
 JUMP_ADDR_2 = 8'h44,
 
 //GOTO
 GOTO = 8'h50,
 GOTO_1 = 8'h51,
 GOTO_2 = 8'h52,
 //Function_start
 FUNCTION_START = 8'h60,
 FUNCTION_START_0 = 8'h61,
 FUNCTION_START_1 = 8'h62,
 //RETURN
 RETURN = 8'h70,
 RETURN_0 = 8'h71,
 //Defrefrence A
 WRITE_TO_MEM_FROM_C = 8'h80,
 WRITE_TO_MEM_FROM_C_1 = 8'h81,
 WRITE_TO_MEM_FROM_C_2 = 8'h82,

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
 //HAM
 HAM_1 = 8'hC0,
 HAM_2 = 8'hC1,
 HAM_3 = 8'hC2;
//Sequential part of the State Machine.
logic [7:0] CurrState, NextState;
//test

always@(posedge CLK) begin
    if(RESET) begin
        CurrState = 8'h00;
        CurrProgCounter = 8'h00;
        CurrProgCounterOffset = 2'h0;
        CurrBusAddr = 8'hFF; //Initial instruction after reset.
        CurrBusDataOut = 0;
        CurrBusDataOutWE = 1'b0;
        for (int i=0; i<16;i++) begin
        CurrReg[i] = 0; 
        end
        for (int i=0; i<16;i++) begin
        CurrSupReg[i] = 0; 
        end  
        CurrRegSelect = 4'b0;
        CurrRegSelect1 = 4'b0;
        CurrRegSelect2 = 4'b0;
        CurrProgContext = 8'h00;
        CurrInterruptAck = 2'b00;
        TempoReg = 0;
    end else begin
        CurrState = NextState;
        CurrProgCounter = NextProgCounter;
        CurrProgCounterOffset = NextProgCounterOffset;
        CurrBusAddr = NextBusAddr;
        CurrBusDataOut = NextBusDataOut;
        CurrBusDataOutWE = NextBusDataOutWE;
        for (int i=0; i<16;i++) begin
        CurrReg[i] = NextReg[i]; 
        end
        for (int i=0; i<16;i++) begin
        CurrSupReg[i] = NextSupReg[i]; 
        end
        CurrRegSelect = NextRegSelect;
        CurrRegSelect1 = NextRegSelect1;
        CurrRegSelect2 = NextRegSelect2;
        CurrProgContext = NextProgContext;
        CurrInterruptAck = NextInterruptAck;
    end
end
//Combinatorial section - large!
always@* begin
//Generic assignment to reduce the complexity of the rest of the S/M
    NextState = CurrState;
    NextProgCounter = CurrProgCounter;
    NextProgCounterOffset = 2'h0;   //this means you have only a small time to get the data memory
    NextBusAddr = 8'hFF;
    NextBusDataOut = CurrBusDataOut;
    NextBusDataOutWE = 1'b0;
      for (int i=0; i<16;i++) begin
        NextReg[i] = CurrReg[i]; 
        end
      for (int i=0; i<16;i++) begin
        NextSupReg[i] = CurrSupReg[i]; 
        end
    NextRegSelect = CurrRegSelect;
    NextRegSelect1 = CurrRegSelect1;
    NextRegSelect2 = CurrRegSelect2;
    NextProgContext = CurrProgContext;
    NextInterruptAck = 2'b00;
//Case statement to describe each state
    case (CurrState)
///////////////////////////////////////////////////////////////////////////////////////
//Thread states.
    IDLE: begin
     if(BUS_INTERRUPTS_RAISE[0]) begin // Interrupt Request A.
        NextState = GET_THREAD_START_ADDR_0;
        NextProgCounter = 8'hFF;
        NextInterruptAck = 2'b01;
     end else if(BUS_INTERRUPTS_RAISE[1]) begin //Interrupt Request B.
        NextState = GET_THREAD_START_ADDR_0;
        NextProgCounter = 8'hFE;
        NextInterruptAck = 2'b10;
     end else begin
        NextState = IDLE;
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
        NextProgCounter = ProgMemoryOut;
    end
//Wait for the new program counter value to settle
    GET_THREAD_START_ADDR_2:
        NextState = CHOOSE_OPP;
///////////////////////////////////////////////////////////////////////////////////////
//CHOOSE_OPP - Another case statement to choose which operation to perform
    CHOOSE_OPP: begin
         case (ProgMemoryOut[19:16])
             4'h0: NextState = READ_FROM_MEM;             //done
             4'h1: NextState = WRITE_TO_MEM;    //done
         
         
             4'h2: begin    //done
                NextState = DO_MATHS_OPP_SAVE;
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
                NextRegSelect2 = ProgMemoryOut[7:4];
             end
             4'h3: begin 
                NextState = IF_A_EQUALITY_B_GOTO;  //done
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
             end
             4'h4: NextState = GOTO;  //done
             4'h5:NextState = IDLE;
             4'h6:NextState = FUNCTION_START;
             4'h7:NextState = RETURN;

             
             4'h8: begin   //done
                NextState = MOVE_1;
                NextBusAddr = ProgMemoryOut[15:8];
             end
             4'h9: begin        //done
                NextState = SUP_1;
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
                NextRegSelect2 = ProgMemoryOut[7:4];
             end
             4'hA: begin
                NextState = DOT_1;
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
                NextRegSelect2 = ProgMemoryOut[7:4];               
             end
             4'hB: begin
                NextState = HAM_1;
                NextRegSelect = ProgMemoryOut[15:12];
                NextRegSelect1 = ProgMemoryOut[11:8];
                NextRegSelect2 = ProgMemoryOut[7:4];
                TempoReg = 0;  
             end   
             4'hC: begin
                NextState = Replace_1;
                TempoReg[SIZE-1-:4] =  ProgMemoryOut[3:0];
                NextProgCounterOffset = 1;
             end
             4'hD: begin
                NextState = Pointer_1;
                NextProgCounter = CurrProgCounter + 1;
                
             end
             4'hE: begin
                NextState = ADD_1;
                NextBusAddr = ProgMemoryOut[11:4];
             end
             default:
             NextState = CurrState;
        endcase
     
    end
///////////////////////////////////////////////////////////////////////////////////////
//Pointer
    Pointer_1: begin
         NextState = CHOOSE_OPP;
         nextpointer_id = {1'b1,ProgMemoryOut[7:4]};
         NextBusAddr = ProgMemoryOut[15:8];
         NextBusDataOut = {60'h000000000000000,ProgMemoryOut[3:0]} ;
    end
//Replace_1
    Replace_1: begin
        NextState = Replace_2;
        
        NextProgCounterOffset = 2;
    end
    Replace_2: begin
        NextState = Replace_3;
        TempoReg[SIZE-5-:20] = ProgMemoryOut;
        NextProgCounterOffset = 3;
    end
    Replace_3: begin
        NextState = Replace_4;
        TempoReg[SIZE-25-:20] = ProgMemoryOut;
        
    end
    Replace_4: begin
        TempoReg[SIZE-35-:20] = ProgMemoryOut;
        NextState = Replace_5;
        NextProgCounter = CurrProgCounter + 4;
    end
    Replace_5: begin
        NextBusAddr = ProgMemoryOut[15:8];
        NextBusDataOut = TempoReg;
        NextBusDataOutWE = 1'b1;
        NextState = CHOOSE_OPP;
        //perhaps add pointer ID;        
    end
// Hamming distance
    HAM_1: begin
        temp_reg1 = CurrReg[CurrRegSelect][count+:valence];
        temp_reg2 = CurrReg[CurrRegSelect][count+:valence];
        NextState = HAM_2;
    end
    HAM_2: begin
        if(temp_reg1 >= temp_reg2) 
           TempoReg = TempoReg + temp_reg1 - temp_reg2;
        else    TempoReg = TempoReg + temp_reg2 - temp_reg1;
        if(count < SIZE-valence) begin
            count = count + valence;
            NextState = HAM_1;
        end
        else begin
            NextReg[CurrRegSelect2] =  TempoReg;
            count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = HAM_3;
        end    
    end
    HAM_3: begin
        NextState = CHOOSE_OPP;
    end
//DOT product
    DOT_1: begin
        temp_reg1 = CurrReg[CurrRegSelect][count+:valence];
        temp_reg2 = CurrReg[CurrRegSelect][count+:valence];
        NextState = DOT_2;
        
    end
    DOT_2: begin
        if(temp_reg1*temp_reg2 >= 2^valence-1 )
        NextReg[CurrRegSelect2][count+:valence] =  2^valence-1;
        else
        NextReg[CurrRegSelect2][count+:valence] =  temp_reg1*temp_reg2;
        if(count < SIZE-valence) begin
            count = count + valence;
            NextState = DOT_1;
        end
        else begin
            count = 0;
            NextProgCounter = CurrProgCounter + 1;
            NextState = DOT_3;
        end    
        
    end
    DOT_3: begin   
        NextState = CHOOSE_OPP;
    end
//Superposition operation
    SUP_1: begin
        NextSupReg[CurrRegSelect2] = {CurrReg[CurrRegSelect],CurrReg[CurrRegSelect1]};
        NextState = SUP_2;
        NextProgCounter = CurrProgCounter + 1;
    end
    SUP_2: begin
        NextState = CHOOSE_OPP;
    end
// MOVE operation
    MOVE_1: begin
        NextState = MOVE_2;
        
    end
    MOVE_2: begin
        NextState = MOVE_3;
        TempoReg = BusDataIn;
        NextProgCounter = CurrProgCounter + 1;
    end
    MOVE_3: begin
        NextState = CHOOSE_OPP;  //read from the address2
        NextBusDataOut =TempoReg;
        NextBusAddr = ProgMemoryOut[7:0];
        NextBusDataOutWE = 1'b1;
    end
    DO_MATHS_OPP_SAVE: begin
        NextState = DO_MATHS_OPP_0;
        NextProgCounter = CurrProgCounter + 1;
        CurrRegA = CurrReg[CurrRegSelect];
        CurrRegB = CurrReg[CurrRegSelect1];
        opcode = ProgMemoryOut[3:0];
    end
    DO_MATHS_OPP_0: begin
        NextState = CHOOSE_OPP;
        NextReg[CurrRegSelect2] = AluOut;
        
    end

//READ_FROM_MEM_TO_A : here starts the memory read operational pipeline.
//Wait state - to give time for the mem address to be read. Reg select is set to 0
    READ_FROM_MEM:begin
        NextState = READ_FROM_MEM_0;
        NextRegSelect = ProgMemoryOut[15:12];
    end

//The address will be valid during this state, so set the BUS_ADDR to this value.
    READ_FROM_MEM_0: begin
        NextState = READ_FROM_MEM_1;
        NextBusAddr = ProgMemoryOut[11:4];   // give the data memory the address we want
    end
//Wait state - to give time for the mem data to be read
//Increment the program counter here. This must be done 2 clock cycles ahead
//so that it presents the right data when required.
    READ_FROM_MEM_1: begin
        NextState = READ_FROM_MEM_2;
        NextProgCounter = CurrProgCounter + 1;
    end
//The data will now have arrived from memory. Write it to the proper register.
    READ_FROM_MEM_2: begin
        NextState = CHOOSE_OPP;
        NextReg[CurrRegSelect] =BusDataIn;
      
    end 
///////////////////////////////////////////////////////////////////////////////////////
//WRITE_TO_MEM_FROM_A : here starts the memory write operational pipeline.
//Wait state - to find the address of where we are writing
//Increment the program counter here. This must be done 2 clock cycles ahead
 //so that it presents the right data when required.
    WRITE_TO_MEM:begin
        NextRegSelect = ProgMemoryOut[15:12];
        if(!ProgMemoryOut[3]) begin
            NextState = WRITE_TO_MEM_0;        
            NextProgCounter = CurrProgCounter + 1;
        end
        else begin
            NextState =WRITE_TO_MEM_FROM_C;
        end
        
    end
//WRITE_TO_MEM_FROM_B : here starts the memory write operational pipeline.
//Wait state - to find the address of where we are writing
//Increment the program counter here. This must be done 2 clock cycles ahead
 // so that it presents the right data when required.

    WRITE_TO_MEM_FROM_C:begin
        NextState =WRITE_TO_MEM_FROM_C_1 ;
        NextBusAddr = ProgMemoryOut[11:4];
        NextBusDataOut = CurrSupReg[CurrRegSelect][127:64]; //need to build another arry for 128bit results register
        NextBusDataOutWE = 1'b1;
        NextProgCounter = CurrProgCounter + 1;
    end
    WRITE_TO_MEM_FROM_C_1:begin
        NextState = CHOOSE_OPP;
        if(ProgMemoryOut[11:4]<128)  NextBusAddr = ProgMemoryOut[11:4]+1; 
        else       NextBusAddr = ProgMemoryOut[11:4]; 
        NextBusDataOut = CurrSupReg[CurrRegSelect][63:0];
        NextBusDataOutWE = 1'b1;
      
    end
 

//The address will be valid during this state, so set the BUS_ADDR to this value,
//and write the value to the memory location.
    WRITE_TO_MEM_0: begin
        NextState = CHOOSE_OPP;
        NextBusAddr = ProgMemoryOut[11:4];
        NextBusDataOut = CurrReg[CurrRegSelect];
       
        NextBusDataOutWE = 1'b1;
     end
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
    IF_A_EQUALITY_B_GOTO: begin
        NextState = JUMP_ADDR;
        CurrRegA = CurrReg[CurrRegSelect];
        CurrRegB = CurrReg[CurrRegSelect1];
        
            
    end
    JUMP_ADDR: begin
        if(CurrRegA == CurrRegB) begin
            NextBusAddr = ProgMemoryOut[7:0];
            NextState = JUMP_ADDR_0;
        end
        else begin
            NextProgCounter = CurrProgCounter + 1;
            NextState = JUMP_ADDR_2;
        end     
    end
    
    JUMP_ADDR_0: begin
        NextState = JUMP_ADDR_1;
    end
    JUMP_ADDR_1: begin
        NextProgCounter = BusDataIn;
        NextState = JUMP_ADDR_2;
    end
    JUMP_ADDR_2: begin
        NextState = CHOOSE_OPP;
    end
    //GOTO ADDR 
    GOTO: begin
        NextState = GOTO_1;
        
    end
    GOTO_1: begin
        NextState = GOTO_2;
        NextProgCounter = ProgMemoryOut[15:8];
    end
    GOTO_2: NextState = CHOOSE_OPP;
    //FUNCTION_START
    FUNCTION_START: begin
        NextProgContext = CurrProgCounter+1;
        NextState = FUNCTION_START_0;
        
    end
    FUNCTION_START_0 : begin
        NextProgCounter = ProgMemoryOut[15:8];
        NextState = FUNCTION_START_1;
    end
    FUNCTION_START_1 : begin
        NextState = CHOOSE_OPP;
    end
    //RETURN
    RETURN: begin
        NextProgCounter = CurrProgContext;
        NextState = RETURN_0;
    end
    RETURN_0: begin
        NextState = CHOOSE_OPP;
    end
    //DE_REFERENCE  

  
    
 endcase
 end
 endmodule
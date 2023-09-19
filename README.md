# RISC-V_Processor


## Register Bank
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/562fb2b7-1c1f-4a10-ac58-30b8d83a7e06)

## Instructions types
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/54c75776-6c32-4d31-b202-e81301bcee21)

### 1. R-Type (Ex. ADD R1, R2, R3)
Opcode is same for a particular type of instruction.

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/24dd6fe9-1688-4098-8a0a-e15e3db84380)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/4ae5d103-9cc2-411b-85f9-a0e8e65b6e08)

### 2. I-Type (Ex. ADDI R1,R2,50) 
All Immediate + Load Instruction
LW R20, offset(Base) --> LW R20,82(R7)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/a6d75433-7a32-43c4-9d3c-101f4d43f76c)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/76a2474f-123b-44bc-8706-4bb543335abb)

### 3. S-Type (Ex. SW R8,78(R11))
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/7133178c-e993-4203-85d3-ac3047a5c835)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/ea6cb054-554a-4969-803f-b0e03b3e2cb6)

### 4. B-Type (BRANCH) (Ex. BEQ R1,R6,label)
Add label with PC and go to that mem location.

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/534f0f80-f5ee-4753-aa4c-a689f62ba03d)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/6f84d486-b768-45e2-aa88-54158f1b5ea7)


## 1. Arithmatic & Logical Unit (ALU)
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/d5b5bb07-8bea-4204-b1c1-3d5c272932dd)
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/e40d51f3-3ac9-44cc-9de2-1de4a3cd69e1)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/882c35a5-1b08-4807-85ca-58e542070186)

### Result of ALU test
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/68a7297c-edb9-4512-884b-8ad6f5628795)


## 2. Control Unit/ Decoder
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/383b6d54-bd83-4004-930b-495e3a01f058)

### Main decoder table
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/c9d96552-ef52-4551-82ba-dad9a724705f)

### ALU decoder table
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/74751234-420e-4977-b9fd-a895df8d47ec)

   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/2e4b0cdd-3268-4b3b-b165-1bbe895416c9)

## 3. Program Counter (PC)
32-bit register. Its output, PC, points to the current instruction. 

Its input, PCNext, indicates the address of the next instruction

## 4. General Purpose Register (GPR)
  * 32-element × 32-bit register file
  * 2-Read port, 1-Write port
  * A1[4:0] -> RD1, A2[4:0] -> RD2, A3[4:0] -> WD3
  * During decoding, A1-> Address of rs1 (source reg-1), A2-> Address of rs2 (source reg-2), A3-> Address of rd (destination reg)
  * 5-bit addr -> 2^5=32 

## 5. Instruction Memory
> Assembly Code --> Machine Code --> Instruction Memory

It takes a 32-bit instruction address input, A, and reads the 32-bit data (i.e., instruction) from that address onto the read data output, RD.

   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/c9e4bec8-00d5-4931-acc2-2a1e73090c4a)

## 6. Data Memory
  * 1-Read, 1-Write port
  * WE = 1, write to addr A @posedge clk
  * WE = 0, read from addr A

## 7. Data-path Design
### Part-1. Data-path for I-type instruction
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/590f7ff9-2f67-40b4-af00-b16092d081eb)

 * 5-sections:
    1. Opcode
    2. Destination reg
    3. function-3
    4. Source reg
    5. Immediate value
   
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/af274291-53a6-4158-b443-3e717f7f8bcb)

 * To read instruction from Instruction Mem.
 * PC indicates the address of Instruction in Instruction Mem.
   
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/d5bc201d-0e69-42fa-824d-7cfe4538ab0a)

 * For I-type instruction,
 * A1 -> Address of rs1 = instruction[19:15]
 * A3 -> Address of rd  = instruction[11:7]

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/41fe55d0-059e-4fd6-a7b7-a7637493dde9)

   * 12-bit immediate input should be signed extended to 32-bits.
  
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/e30c67f1-9a7a-44c3-b779-87bc80c1f1bc)

   * ALU srcA -> Source reg-1
   * ALU srcB -> Immediate data
   * For load instruction, alu_control = 000, to add Base + Offset = Effective Addr

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/72dfc3ed-3526-4cc6-96f5-b02b9b2588c6)

   * ALU Result = Effective Addr -> Goes to Address line of Data Mem
   * Read data from Data Mem and write to destination reg of GPR. A3 -> Address of rd  = instruction[11:7]
   * Control signal RegWrite becomes = 1
   * Write happens @posedge clk
   * One instruction is complete

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/55e7cd6e-a82c-4d65-9927-4fd05c4eb81c)

   * One instruction is complete
   * The processor must compute the address of the next instruction
   * PC <= PC + 4 @posedge clk

### Part-2. Data-path for S-type instruction
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/0cc3fca7-2880-4625-90b9-ba57854f2cde)

 * 6-sections:
    1. Opcode
    2. imm[4:0]
    3. function-3
    4. Source reg-1
    5. Source reg-2
    6. Immediate value[11:5]

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/5fd0b505-314e-415e-bd89-593f43980589)

   * Depending on ImmSrc, extend the value of immediate value.
   * Connect other control signals -> ImmSrc, MemWrite
   * GPR -> A2 = Instr[24:20]
   * Connect WriteData



### Part-3. Data-path for R-type instruction
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/5a6e4238-07a5-49a7-9644-ddb4b4547ae5)

 * 6-sections:
    1. Opcode
    2. Destination Reg
    3. function-3
    4. Source Reg-1
    5. Source Reg-2
    6. function-7
       
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/cdf9ff41-ef9e-4dcd-bd58-5ab2842538a8)

   * Add MUX-1 to select ImmExt or RD2 for I-type and R-type instructions.
   * Add MUX-2 to select ReadData or ALUResult for I-type (Load) and R-type instructions.


## RTL Schamatic
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/af9761d9-a698-451c-beb6-db87df564860)


## RTL Verification
### Test-1: LW x6, -4(x9) --> 0xFFC4A303
   * Imm = -4
   * A1  = 9 (Source)
   * A3  = 6 (Destination)
   * Effective addr = [x9] - 4 = 24 - 4 = 20
   * Data_mem[20] = 50
   * [x6] = ? = 50 = Data_mem[20]
   * PC, Data write at GPR and data mem are dependds on clk.
   * So, here all datas are available before (Combinational ckt). Only Writing at GPR happens at 1 clk.

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/65d59c8f-7442-45f9-a9bf-fc709d795d4e)


### Test-2: ADDI x5, x0, 0x5 --> 0x00500293
   * Imm = 5
   * A1  = 0 (Source)
   * A3  = 5 (Destination)
   * alu_result = 5 + 0 = 5
   * [x5] = 5
   * PC, Data write at GPR and data mem are dependds on clk.
   * So, here all datas are available before (Combinational ckt). Only Writing at GPR happens at 1 clk.

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/1b2bb9d2-c795-419d-90c3-16f023221ed3)

### Test-3: 
   * mem[0] = ADDI x5, x0, 0x5 --> 0x00500293
   * mem[4] = ADDI x6, x0, 0x4 --> 0x00400313
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/5991eff0-801e-4fd2-82c6-842fa19ac744)

### Test-4: SW x6 8(x9) --> 0x0064_A423
   * Imm = 8
   * A1  = 9 (Source-1)
   * A2  = 6 (Source-2)
   * Effective addr = [x9] + 8 = 20 + 8 = 28
   * [x6] = 10
   * Data_mem[28] = ? = 10 = [x6]
   * PC, Data write at GPR and data mem are dependds on clk.
   * So, here all datas are available before (Combinational ckt). Only Writing at Data_mem happens at 1 clk.

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/3444018f-a0ef-400f-988c-9ca0ac25a2ea)

### Test-5: OR x4, x5, x6 --> 0x0062_E233
   * A1  = 5 (Source-1)
   * A2  = 6 (Source-2)
   * A3  = 4 (Destination)
   * [x5] = 6, [x6] = 10
   * ALU_result = Result = 6 | 10 = 14
   * [x4] = ? = 14
   * PC, Data write at GPR and data mem are dependds on clk.
   * So, here all datas are available before (Combinational ckt). Only Writing at GPR happens at 1 clk.
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/cb686f91-2387-4d45-ba4e-702739f8cebe)

### Test-6:
  * mem[0] = ADDI x5, x0, 0x5 --> 0x0050_0293;
  * mem[4] = ADDI x6, x0, 0x4 --> 0x0040_0313;
  * mem[8] = OR   x7, x5, x6  --> 0x0062_E3B3;
  * mem[12]= AND  x8, x5, x6  --> 0x0062_F433;

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/0e184847-3784-4e11-b02f-5ed2fb7176b6)

### Test-7: Using .txt file as input
```$readmemh("memfile.txt",uut.instruc_mem.mem);```

Content of "memfile.txt"

```
@0  00500293	//ADDI x5, x0, 0x5
@4  00400313	//ADDI x6, x0, 0x4
@8  0062E3B3	//OR   x7, x5, x6
@C  0062F433	//AND  x8, x5, x6
```
![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/0e184847-3784-4e11-b02f-5ed2fb7176b6)



#### References:  
1. [link1](https://github.com/merldsu/RISCV_Single_Cycle_Core/tree/main)
2. [link2](https://github.com/merldsu/RISCV_Single_Cycle_Core/blob/main/doc/RISCV_Single_Cycle_Microarchitecture.pdf)
3. [link3](https://www.youtube.com/playlist?list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc)
4. [link4](https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)


# Physical Design of RISC-V processor

## 1. Synthesis
![gui_schematic](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/f8a6c941-a2bb-4ebd-bf2d-38ab7c7ec02a)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/7ee827ef-d261-40cf-b15c-61125b724458)

![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/8dd4a3eb-a648-4189-8256-a02424fc7245)

### Reports
   * ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/345f0791-6664-4fcf-bc4a-3d7793e4ecf6)
   * Slack = 10ps => (+)ve
   * Area = 2787993.364 µm²

## 2. Layout

### 1. Power Ring and strips
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/2fe86d2c-5f76-4997-a59f-425f406de6d1)

### 2. Std cell placement
   ![image](https://github.com/Sourav365/RISC-V_Processor/assets/49667585/2d25a11f-898c-4f6b-b0ab-3ce5996aab26)

### 3. Routing
   

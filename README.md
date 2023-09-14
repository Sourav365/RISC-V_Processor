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



#### References:  
1. [link1](https://github.com/merldsu/RISCV_Single_Cycle_Core/tree/main)
2. [link2](https://github.com/merldsu/RISCV_Single_Cycle_Core/blob/main/doc/RISCV_Single_Cycle_Microarchitecture.pdf)
3. [link3](https://www.youtube.com/playlist?list=PL5AmAh9QoSK7Fwk9vOJu-3VqBng_HjGFc)
4. [link4](https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf)

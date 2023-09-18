`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 12:01:18 AM
// Design Name: 
// Module Name: riscV_top
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


module riscV_top #(parameter N=32)(
    input clk, rst
    );
    
    wire [N-1:0] pc, instr, srcA, srcB, ALUResult, ReadData, PC_next, WriteData, ImmExt, Result;
    wire [2:0] ALUControl;
    wire [1:0] ImmSrc;
    wire RegWrite, MemWrite, ALUSrc, ResultSrc;
    
    
    /*********Control Path**********/
    
    control_unit control_unit(
    .opcode(instr[6:0]),
    .funct3(instr[14:12]),
    .funct7(instr[31:25]),    
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Branch(),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl)
    );
    
    
    /**********Data Path**********/
    
    program_counter prog_counter(
    .clk(clk), .rst(rst),
    .PC_next(PC_next),
    .PC(pc)
    );
    
    pc_adder pc_add(
    .a(pc), 
    .b(4),
    .c(PC_next)
    );
    
    instruction_mem instruc_mem(
    .rst(rst),
    .A(pc),
    .RD(instr)
    );
    
    gen_purpose_reg gpr(
    .clk(clk), .rst(rst),
    .WE3(RegWrite),
    .A1(instr[19:15]), 
    .A2(instr[24:20]), 
    .A3(instr[11:7]),
    .WD3(Result),
    .RD1(srcA), 
    .RD2(WriteData)
    );
    
    sign_extend sgn_ext(
    .In(instr),
    .ImmSrc(ImmSrc[0]),
    .Imm_Ext(ImmExt)
    );
    
    mux_2x1 gpr_2_alu(
    .I0(WriteData), .I1(ImmExt), 
    .S(ALUSrc),
    .Y(srcB)
    );
    
    alu alu(
    .A(srcA),.B(srcB),
    .alu_control(ALUControl),
    .f_negative(), .f_zero(), .f_carry(), .f_overFlow(),
    .Result(ALUResult)
    );
    
    data_mem data_mem(
    .clk(clk), .rst(rst),
    .WE(MemWrite),
    .A(ALUResult), 
    .WD(WriteData),
    .RD(ReadData)
    );
    
    mux_2x1 data_mem_2_gpr(
    .I0(ALUResult), .I1(ReadData), 
    .S(ResultSrc),
    .Y(Result)
    );
    
    
endmodule

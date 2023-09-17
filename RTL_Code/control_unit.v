`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 05:27:42 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    
    output ResultSrc,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    output Branch,
    output [1:0]ImmSrc,
    output [2:0]ALUControl
    );

    wire [1:0] ALUOp;

    main_decoder main_decoder(
    .opcode(opcode),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite), 
    .ResultSrc(ResultSrc), 
    .Branch(Branch),
    .ImmSrc(ImmSrc), 
    .ALUOp(ALUOp)
    );

    alu_decoder alu_decoder(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .ALUOp(ALUOp),  
    .ALUControl(ALUControl)
    );


endmodule

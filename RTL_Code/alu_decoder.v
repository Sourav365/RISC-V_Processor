`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:34:44 PM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    input [1:0] ALUOp,  
    output [2:0] ALUControl
    );

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 : //ADD
                        (ALUOp == 2'b01) ? 3'b001 : //SUB
                        ((ALUOp == 2'b10) & (funct3 == 3'b000)  & ({opcode[5],funct7[5]} == 2'b11)) ? 3'b001 : //SUB
                        ((ALUOp == 2'b10) & (funct3 == 3'b000)  & ({opcode[5],funct7[5]} != 2'b11)) ? 3'b000 : //ADD
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : //SLT
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : //OR
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : //AND
                                                                  3'b000 ; //Default
endmodule

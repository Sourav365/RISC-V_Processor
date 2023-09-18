`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 04:17:19 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    input [6:0] opcode,
    output RegWrite, ALUSrc, MemWrite, ResultSrc, Branch,
    output [1:0] ImmSrc, ALUOp
    );

    assign RegWrite  = (opcode == 7'b0000011 | opcode == 7'b0010011 | opcode == 7'b0110011) ? 1'b1 : 1'b0 ;
    assign ImmSrc    = (opcode == 7'b0100011) ? 2'b01 : (opcode == 7'b1100011) ? 2'b10 : 2'b00 ;
    assign ALUSrc    = (opcode == 7'b0000011 | opcode == 7'b0100011 | opcode == 7'b0010011) ? 1'b1 : 1'b0 ;
    assign MemWrite  = (opcode == 7'b0100011) ? 1'b1 : 1'b0 ;
    assign ResultSrc = (opcode == 7'b0000011) ? 1'b1 : 1'b0 ;
    assign Branch    = (opcode == 7'b1100011) ? 1'b1 : 1'b0 ;
    assign ALUOp     = (opcode == 7'b0110011) ? 2'b10 : (opcode == 7'b1100011) ? 2'b01 : 2'b00 ;

endmodule

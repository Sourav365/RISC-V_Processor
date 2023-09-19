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

    //RegWrite=1 --> when, LW(0000011), Other I-type(0010011), R-type(0110011) 
    assign RegWrite  = (opcode == 7'b0000011 | opcode == 7'b0010011 | opcode == 7'b0110011) ? 1'b1 : 1'b0 ; 
    
    //ImmSrc= 01 --> S-type(0100011), 10 --> B-type(1100011), 00 --> I-type(0010011), xx --> R-type
    //ImmSrc[0] ==> 1: S-type, 0: I-type
    assign ImmSrc    = (opcode == 7'b0100011) ? 2'b01 : (opcode == 7'b1100011) ? 2'b10 : 2'b00 ;

    //ALUSrc=1 --> when, LW(0000011), Other I-type(0010011), S-type(0100011) => Where immediate data
    assign ALUSrc    = (opcode == 7'b0000011 | opcode == 7'b0100011 | opcode == 7'b0010011) ? 1'b1 : 1'b0 ;

    //MemWrite=1 --> when S-type(0100011)
    assign MemWrite  = (opcode == 7'b0100011) ? 1'b1 : 1'b0 ;

    //ResultSrc=1 --> when LW(0000011)
    assign ResultSrc = (opcode == 7'b0000011) ? 1'b1 : 1'b0 ;

    //Branch=1 --> when, B-type(1100011)
    assign Branch    = (opcode == 7'b1100011) ? 1'b1 : 1'b0 ;

    //ALUOp = 10: R-type(0110011), 01: B-type(1100011), 00: LW, Other I-type, S-type
    assign ALUOp     = (opcode == 7'b0110011) ? 2'b10 : (opcode == 7'b1100011) ? 2'b01 : 2'b00 ;

endmodule

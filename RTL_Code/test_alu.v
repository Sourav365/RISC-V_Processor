`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 12:14:37 PM
// Design Name: 
// Module Name: test_alu
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


module test_alu();

    parameter N=32;
    reg  [N-1:0] A,B;
    reg  [2:0] alu_control;
    wire f_negative, f_zero, f_carry, f_overFlow;
    wire [N-1:0]Result;
    
    
    alu uut(A,B,
    alu_control,
    f_negative, f_zero, f_carry, f_overFlow,
    Result
    );
    
    initial begin
        alu_control = 3'b011;  //OR
        A=32'b1000_0000_1101_0000_0000_0000_0000_0000;
        B=32'b1000_0000_1101_0000_0000_0000_1111_0000;
        #10;
        
        alu_control = 3'b010;  //AND
        A=32'b1000_0000_1101_0000_0000_0000_0100_0000;
        B=32'b1000_0000_1101_0000_0000_0000_1111_0000;
        #10;
        
        alu_control = 3'b000;  //ADD
        A=32'b0111_1111_1111_1111_1111_1111_1111_1111;//0000_1101_0000_0000_0000_0000_0000;
        B=32'b0111_1111_1111_1111_1111_1111_1111_1111;//0000_1101_0000_0000_0000_1111_0000;
        #10;
        
        alu_control = 3'b001;  //SUB
        A=32'h0; //b1111_0000_1101_0000_0000_0000_0000_0000;
        B=32'hffffffff; //b0000_0000_1101_0000_0000_0000_1111_0000;
        #10;
        
        alu_control = 3'b101;  //SLT
        A=32'b1000_0000_1101_0000_0000_0000_0000_0000;
        B=32'b1000_0000_1101_0000_0000_0000_1111_0000;
        #10;
        
        
    end
endmodule

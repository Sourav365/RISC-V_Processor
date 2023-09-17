`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 12:08:07 AM
// Design Name: 
// Module Name: alu
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


module alu #(N=32)(
    input [N-1:0] A,B,
    input [2:0] alu_control,
    output f_negative, f_zero, f_carry, f_overFlow,
    output reg [N-1:0]Result
    );

    wire cout;
    wire [N-1:0] sum;
    
    assign {cout, sum} = alu_control[0] ? (A + (~B + 1)) : (A + B) ; //0-> Add, 1-> Sub
    
    always @(*) begin
        case (alu_control)
            3'b000: Result <= sum; //ADD
            3'b001: Result <= sum; //SUB
            3'b010: Result <= A & B; //AND
            3'b011: Result <= A | B; //OR
            3'b101: Result <= {{31{1'b0}},(sum[31])}; //For SLT /////////////////
            default:Result <= {32{1'b0}};
        endcase
    end

    // Flag setting
    assign f_negative = Result[31];
    assign f_zero = &(~Result);
    assign f_carry = ((~alu_control[1]) & cout);
    assign f_overFlow = ((sum[31] ^ A[31]) & (~(alu_control[0] ^ B[31] ^ A[31])) & (~alu_control[1]));
    /*assign f_overflow = (((A[31] & B[31] & ~sum[31]) | (~A[31] & ~B[31] & sum[31])) & ~alu_control[0] & ~alu_control[1]) | //For Addition
                        (((A[31] & ~B[31] & ~sum[31]) | (~A[31] & B[31] & sum[31])) &  alu_control[0] & ~alu_control[1]) ; //For Substruction
    */                  

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 07:09:48 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(parameter N = 32)(
    input  clk, rst,
    input  [N-1:0] PC_next,
    output reg [N-1:0] PC
    );

    always @(posedge clk or posedge rst) begin
        if(rst) PC <= {32{1'b0}};
        else    PC <= PC_next;
    end
endmodule
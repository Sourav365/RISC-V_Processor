`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 09:11:38 PM
// Design Name: 
// Module Name: gen_purpose_reg
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


module gen_purpose_reg #(parameter N=32)(
    input clk, rst,
    input WE3,
    input [4:0] A1, A2, A3,
    input [N-1:0] WD3,
    output [N-1:0] RD1, RD2
    );

    reg [N-1:0] gpr [N-1:0];

    always @ (posedge clk) begin
        if(WE3) gpr[A3] <= WD3;
    end

    assign RD1 = rst ? {32{1'b0}} : gpr[A1];
    assign RD2 = rst ? {32{1'b0}} : gpr[A2];
    
//    initial gpr[9] = 32'h00000020;
//    initial gpr[6] = 32'h00000040;
    
//    initial gpr[5] = 32'h00000005;
//    initial gpr[6] = 32'h00000004;
    
    /*initial begin
        Register[5] = 32'h00000005;
        Register[6] = 32'h00000004;
        
    end*/
    
endmodule
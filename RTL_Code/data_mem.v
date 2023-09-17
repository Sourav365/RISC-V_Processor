`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 09:45:59 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem #(parameter N=32, MEM_SIZE = 1024)(
    input  clk, rst,
    input  WE,
    input  [N-1:0] A, WD,
    output [N-1:0] RD
    );

    reg [N-1:0] mem [MEM_SIZE-1:0];

    always @ (posedge clk) begin
        if(WE) mem[A] <= WD;
    end

    assign RD = rst ? {32{1'b0}} : mem[A];///////////

    initial begin
        //mem[28] = 32'h00000020;
        //mem[40] = 32'h00000002;
    end


endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 06:57:43 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem #(parameter N = 32, MEM_SIZE = 1024)(
  input rst,
  input  [N-1:0] A,
  output [N-1:0] RD
  );

  reg [N-1:0] mem [MEM_SIZE-1:0];
  
  assign RD = rst ? {32{1'b0}} : mem[A];
  
endmodule
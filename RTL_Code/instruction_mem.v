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
  
  assign RD = rst ? {32{1'b0}} : mem[A[31:2]]; ////////////??????????????
  
  //initial mem[0] = 32'hFFC4A303; //LW x6 -4(x9)
  //initial mem[0] = 32'h0064A423; //SW x6, 8(x9)
  //initial mem[0] = 32'h0062E233; //OR x4, x5, x6
  
  initial begin
    mem[0] = 32'h00500293;
    mem[1] = 32'h00400313;
    mem[2] = 32'h0062E3B3;
    mem[3] = 32'h0062F433;

  end
  
  
  
  /*initial begin
    $readmemh("memfile.hex",mem);
  end*/


/*
  initial begin
    //mem[0] = 32'hFFC4A303;
    //mem[1] = 32'h00832383;
    // mem[0] = 32'h0064A423;
    // mem[1] = 32'h00B62423;
    mem[0] = 32'h0062E233;
    // mem[1] = 32'h00B62423;

  end
*/
endmodule
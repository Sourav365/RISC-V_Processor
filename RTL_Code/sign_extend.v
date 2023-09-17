`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 11:18:26 PM
// Design Name: 
// Module Name: sign_extend
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


module sign_extend #(parameter N=32)(
    input [N-1:0] In,
    input ImmSrc,
    output [N-1:0]Imm_Ext
    );
    
    //assign Imm_Ext = {{20{In[31]}}, In[31:20]}; //Immediate 12-bits to 32-bits for I-type instruction
    
    //ImmSrc=0 --> I-type
    //ImmSrc=1 --> S-type
    assign Imm_Ext = (ImmSrc == 1'b1) ? ({{20{In[31]}},In[31:25],In[11:7]}) : {{20{In[31]}},In[31:20]};
    
                           
endmodule
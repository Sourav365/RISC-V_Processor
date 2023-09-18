`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 03:29:26 PM
// Design Name: 
// Module Name: test_riscV
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


module test_riscV();

    reg clk, rst;
    
    riscV_top uut(
    clk, rst
    );
    
    always #5 clk = ~clk;
    
    
    /*********Test-1: LW x6 -4(x9)***********/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'hFFC4_A303;
        uut.data_mem.mem[20]=50;
        uut.gpr.gpr[9] = 24;
    end*/
    
    /*********Test-2: ADDI x5, x0, 0x5***********/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'h0050_0293;
    end*/
    
    /*********Test-3: ADDI x5, x0, 0x5;    ADDI x6, x0, 0x4;  ***********/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'h0050_0293;
        uut.instruc_mem.mem[4] = 32'h0040_0313;
    end*/
    
    /*********Test-4: SW x6 8(x9)***********/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'h0064_A423;
        uut.gpr.gpr[6] = 10;
        uut.gpr.gpr[9] = 20;
    end*/
    
    /*********Test-5: SW x6 8(x9)***********/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'h0062_E233;
        uut.gpr.gpr[5] = 6;
        uut.gpr.gpr[6] = 10;
    end*/
    
   /****************Test-6:*********************/
    /*initial begin
        uut.instruc_mem.mem[0] = 32'h0050_0293;
        uut.instruc_mem.mem[4] = 32'h0040_0313;
        uut.instruc_mem.mem[8] = 32'h0062_E3B3;
        uut.instruc_mem.mem[12]= 32'h0062_F433;
    end*/
    
    /****************Test-7:*********************/
    initial begin
        $readmemh("F:/Sourav_Das/NanophotonicsLab/Data/works/Sourav/Vivado/risc-v/data/memfile.txt",uut.instruc_mem.mem);
    end
    
    
    initial begin
        rst = 1; clk = 0; #5;
        rst=0;
        
        $finish;
    end
    
    
endmodule

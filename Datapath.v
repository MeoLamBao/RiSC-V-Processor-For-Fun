module Datpath (
input PCSel, ImmSel, RegWEn, BrUn, ASel, BSel, ALUControl, MemRW,
input rst, clk,
input [1:0] WBControl,
output BrEq, BrLT,
output [31:0] INST

);

wire [1:0] MuxWB;
wire [3:0] ALUControl
wire [4:0] AddrA, AddrB, AddrW;
wire [31:0] PC_in, PC_out, Imm, ReadD, RD1, RD2, OutMA, OutMB, ALU_Result, WB1, WB2, PC4;


ADD_PC (PC_out, PC4)
PC PC(PC_in, PC_out, rst, clk);
Instruction_memory IMEM(PC_out, INST);
ImmGen IG(INST, ImmSel, Imm);
Register RF(AddrB, AddrA, WriteData, RegWEN, AddrW, RD1, RD2, clk);
mux2_32bit MuxA (RD1, PC_out, ASel, OutMA);
mux2_32bit MuxB (RD2, Imm, BSel, OutMB);
ALU ALU (OutMA, OutMB, ALUControl, ALU_Result);
Data_Memory (clk, rst, ALU_Result, RD2, MemRW, ReadD);
Mux2_32bit inst1 (ReadD, ALU_Result, WBControl[0], WB1);
mux2_32bit inst2 (WB1, PC4, WBControl[1], WB2);
Mux2_32bit inst3 (ALU_Result, PC4, PCSel, PC_in);




endmodule
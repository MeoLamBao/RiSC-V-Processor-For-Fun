`timescale 1ns/1ps
module Data_memory (
    input CLK, RST,  
    input [31:0] A, // ALU_OUT = memory address
    input [31:0] WD,
    input [1:0] RWE,
    output [31:0] RD
);

    reg [31:0] MEMORY [63:0];
    integer i;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
           for (i = 0; i < 64 ; i = i + 1) begin
                MEMORY[i] = 32'b0;
           end
        end
        else begin
            if (RWE == 1)  MEMORY[A] <= {{24{WD[7]}}, WD[7:0]}; // SB instruction
            else if (RWE == 2)  MEMORY[A] <= {{16{WD[7]}}, WD[15:0]}; // SH instruction
            else if (RWE == 3)  MEMORY[A] <= WD; // SW instruction
        end
    end
    assign  RD = MEMORY[A];
endmodule 

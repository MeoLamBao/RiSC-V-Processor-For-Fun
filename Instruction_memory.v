module Instruction_memory(

input [31:0] address,
output [31:0] instruction
);

reg [31:0] temp [63:0];

initial $readmemb("instruction.txt", temp);
assign instruction = temp[address];

endmodule
module ADD_PC(
input [31:0] in,
output [31:0] out
);

assign out = in + 32'd4;

endmodule
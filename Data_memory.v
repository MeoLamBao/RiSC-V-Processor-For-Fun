module Data_memory(
input clk, En_RW,
input [31:0] Address,
input [31:0] Write_Data,
output reg [31:0] Read_Data
);

reg [31:0] mem [31:0]

always @(posedge clk)

begin
	if (En_RW) begin
		mem[Address] = Write_Data;
	end
	else begin
		Read_Data = mem[Address];
	end
end
endmodule
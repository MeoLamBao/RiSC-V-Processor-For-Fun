`timescale 1ns/1ps
module BranchComp (
input [31:0] DataA,
input [31:0] DataB,
input BrUn,
output reg BrEq,
output reg BrLT
);

// Comparator logic
always @(*) begin
	case (BrUn) 
	1'b0 : begin
		if ($signed(DataA) == $signed(DataB)) BrEq <= 1'b1;
		else BrEq <= 1'b0;
		if (DataA < DataB) BrLT <= 1'b1;
		else BrLT <= 1'b0;
	end
	1'b1 : begin
		if ((DataA) == (DataB)) BrEq <= 1'b1;
		else BrEq <= 1'b0;
		if ($unsigned(DataA) < $unsigned(DataB)) BrLT <= 1'b1;
		else BrLT <= 1'b0;
	end
	endcase
end


endmodule

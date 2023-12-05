`timescale 1ns/1ps
module ALU(

input [31:0] inA, inB,
input [3:0] ALU_control,
output reg [31:0] Result

);



always @(*)
	begin 
		case (ALU_control)
			4'b0000: Result = inA + inB;	//A+B
			4'b0001: Result = inA - inB;	//A-B
			4'b0010: Result = inA & inB;	//A and B
			4'b0011: Result = inA | inB;	//A or B
			4'b0100: Result = inA << inB;	//shift left
			4'b0101: Result = inA >> inB;	//shift right
			4'b0110: Result = inA >>> inB; 	//A>>>B
			4'b0111: Result = inA ^ inB;	//A xor B
			4'b1000:	Result = ($signed(inA) < $signed(inB)) ? 1 : 0;	//SLT
			4'b1001: Result = (inA < inB) ? 1 : 0; // SLTU
			4'b1010: Result = inB; // lui
			default : Result = 31'd0;
		endcase
	end
		
endmodule

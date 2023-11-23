module ALU(

input [31:0] inA, inB,
input [3:0] ALU_control,
output reg [31:0] Result,
output reg Zero_F, Sign_F

);



always @(*)
	begin 
		case (ALU_control)
			4'b0000: Result = inA + inB;	//A+B
			4'b0001: Result = inA - inB;	//A-B
			4'b0010: Result = inA & inB;	//A and B
			4'b0100: Result = inA | inB;	//A or b
			4'b1000: begin	//set on less than
				if (inA < inB) 
					Result = 1;
				else
					Result = 0;
			end
			4'b0011: Result = inA << inB;	//shift left
			4'b0101: Result = inA >> inB;	//shift right
			4'b0110: Result = inA >>> inB; 	//A>>>B
			4'b0111: Result = inA ^ inB;	//A xor B
			
		endcase
		
		if (Result == 0) 
			ZF = 1'b1;
		else
			ZF = 1'b0;
		
		SF = Result[31];
	end
endmodule

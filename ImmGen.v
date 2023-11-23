module ImmGen (
		 input [31:0] INST,
		 input ImmSel,
		 output reg [31:0] IMM_OUT
	);
	
	wire [6:0] OPCODE;
	assign OPCODE = INS[6:0];
	
	// Opcode parameters
    parameter TYPE_I_R      = 7'b0010011;
	parameter LUI           = 7'b0110111;
    parameter AUIPC         = 7'b0010111;
    parameter TYPE_B        = 7'b1100011;
    parameter TYPE_I_LOAD   = 7'b0000011;
    parameter TYPE_S        = 7'b0100011;
    parameter TYPE_JAL      = 7'b1101111;
    parameter TYPE_JALR     = 7'b1100111;
	
	always@(*) begin
		if (ImmSel) begin
			case(OPCODE)
				TYPE_I_R:
					IMM_OUT = {{20{INST[31]}}, INST[31:20]};
				LUI:
					IMM_OUT = {INST[31:12], 12'b0};
				AUIPC:
					IMM_OUT = {INST[31:12], 12'b0};
				TYPE_B:
					IMM_OUT = {{20{INST[31]}}, INST[7], INST[30:25], INST[11:8],1'b0};
				TYPE_I_LOAD:
					IMM_OUT = {{20{INST[31]}}, INST[31:20]};
				TYPE_S:
					IMM_OUT = {{20{INST[31]}}, INST[31:25], INST[11:7]};
				TYPE_JAL:
					IMM_OUT = {{12{INST[31]}}, INS[19:12], INST[20], INST[30:21],1'b0};
				TYPE_JALR:
					IMM_OUT = {{20{INST[31]}}, INST[31:20]};
				default: IMM_OUT = {32{1'b0}};  // Default to zero if an unsupported opcode is specified
			endcase
		end 
		else 
			// If ImmSel is not active, set IMM_OUT to zero
         IMM_OUT = {32{1'b0}};
	end
endmodule
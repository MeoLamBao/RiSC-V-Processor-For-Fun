module register(ReadData1, ReadData2, WriteData, RegWEn, WriteAddress, ReadAddress1, ReadAddress2, CLK, rst );
input [2:0] RegWEn;
input CLK, rst;	
input [4:0] WriteAddress, ReadAddress1, ReadAddress2;
input [31:0] WriteData;
output [31:0] ReadData1, ReadData2;

reg [31:0] array_reg [31:0];
reg [31:0] reg1, reg2;
integer i;
	
always @(posedge CLK or posedge rst) begin
	if(rst) begin
		for (i = 0 ; i < 32 ; i = i + 1) begin
			array_reg[i] <= 32'd0;
		end
		
	end
	else if(RegWEn) array_reg[WriteAddress] <= WriteData;
end

always @(*) begin 
		case (RegWEn)
			3'b001 : begin
				reg1 <= array_reg[ReadAddress1];
				reg2 <= array_reg[ReadAddress2];
			end
			3'b010 : begin
				reg2 <= {{24{array_reg[ReadAddress2][7]}},{array_reg[ReadAddress2][7:0]}};
			end
			3'b011 : begin
				reg2 <= {{16{array_reg[ReadAddress2][15]}},{array_reg[ReadAddress2][15:0]}};
			end
			3'b100 : begin
				reg2 <= array_reg[ReadAddress2][7:0];
			end
			3'b101 : begin
				reg2 <= array_reg[ReadAddress2][15:0];
			end
			default : begin
				reg1 <= array_reg[ReadAddress1];
				reg2 <= array_reg[ReadAddress2];
			end
		endcase
		
end

assign ReadData1 = reg1;
assign ReadData2 = reg2;
	
endmodule



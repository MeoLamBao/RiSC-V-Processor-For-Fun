module PC(Out, In, rst, clk);
	input[31:0] In;
	input rst, clk;
	output reg[31:0] Out;
	
	always @(posedge clk) begin
		if(rst) Out = 32'd0;
		else Out = In;
	end
	
endmodule

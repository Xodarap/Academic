module shifter1 (In, Op, Go, Out);
	input [15:0] In;
	input [1:0]  Op;
	input Go;
	output [15:0] Out;
	reg [15:0] tmp;
	always@(In, Op) case (Op)
		// Rotate left
		2'b00: begin 
			tmp = In << 1;
			tmp[0] = In[15];
		end
		// Shift left
		2'b01: tmp = In << 1;

		// Arithmetic shift right
		2'b10: begin
			tmp = In >> 1;
			tmp[15] = In[15];
		end
		// Shift right
		2'b11: tmp = In >> 1;
	endcase

	assign Out = Go ? tmp : In;
endmodule


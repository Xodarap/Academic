module shifter4 (In, Op, Go, Out);
	input [15:0] In;
	input [1:0]  Op;
	input Go;
	output [15:0] Out;
	wire [15:0] tmp, tmp2;

	shifter2 s0 (In, Op, Go, tmp);
	shifter2 s1 (tmp, Op, Go, tmp2);
	assign Out = Go ? tmp2 : In;
endmodule


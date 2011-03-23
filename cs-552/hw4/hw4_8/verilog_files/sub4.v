module sub4(A, B, S);
	input [3:0] A, B;
	output [3:0] S;
	wire [3:0] twosS, negB;
	wire temp, temp2;
	
	assign negB = ~B;
	adder4 a1(.A(4'b0001), .B(negB), .SUM(twosS), .CI(0), .CO(temp));
	adder4 a2(.A(A), .B(twosS), .SUM(S), .CI(0), .CO(temp2));
endmodule
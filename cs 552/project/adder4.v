module adder4(A, B, Cin, S);
   input [3:0] A, B;
   input       Cin;
   output [3:0] S;
   wire [3:0] 	C;
   
   // Note that we just throw out the carries
   // since we use the info from the lookahead instead
   adder1 a1(A[0], B[0], Cin, S[0], C[0]);
   adder1 a2(A[1], B[1], C[0], S[1], C[1]);
   adder1 a3(A[2], B[2], C[1], S[2], C[2]);
   adder1 a4(A[3], B[3], C[2], S[3], C[3]);
 
endmodule
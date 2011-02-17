module adder16(A, B, Cin, S, Cout);
   input [15:0] A, B;
   input 	Cin;
<<<<<<< HEAD
   output 	Cout;
   output [15:0] S;
   wire [3:0] 	 G, P;
   wire [2:0] 	 C;
 	
   fourbitfull f1(A[3:0], B[3:0], Cin, S[3:0], G[0], P[0], C[0]);
   fourbitfull f2(A[7:4], B[7:4], C[0], S[7:4], G[1], P[1], C[1]);
   fourbitfull f3(A[11:8], B[11:8], C[1], S[11:8], G[2], P[2], C[2]);
   fourbitfull f4(A[15:12], B[15:12], C[2], S[15:12], G[3], P[3], Cout);
endmodule // adder16

   
=======
   output [15:0] S;
   output 	 Cout;
   wire [3:0] 	 G, P;
   wire [2:0] 	 C;
   
   // find lookahead stuff
   fourbitlookahead f1(A[3:0], B[3:0], G[0], P[0]);
   fourbitlookahead f2(A[7:4], B[7:4], G[1], P[1]);
   fourbitlookahead f3(A[11:8], B[11:8], G[2], P[2]);
   fourbitlookahead f4(A[15:12], B[15:12], G[3], P[3]);

   // Based on the lookaheads, let's figure out what the carries will
   // be
   assign C[0] = G[0] | (P[0] & Cin);
   assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
   assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
   assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & Cin);
   
   // do adds
   adder4 a1(A[3:0], B[3:0], Cin, S[3:0]);
   adder4 a2(A[7:4], B[7:4], C[0], S[7:4]);
   adder4 a3(A[11:8], B[11:8], C[1], S[11:8]);
   adder4 a4(A[15:12], B[15:12], C[2], S[15:12]);
endmodule
 
>>>>>>> 4522979e66c4c4928486f4586e006d20a0267740

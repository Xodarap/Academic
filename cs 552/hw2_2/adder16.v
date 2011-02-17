module adder16(A, B, Cin, S, Cout);
   input [15:0] A, B;
   input 	Cin;
   output 	Cout;
   output [15:0] S;
   wire [3:0] 	 G, P;
   wire [2:0] 	 C;
 	
   fourbitfull f1(A[3:0], B[3:0], Cin, S[3:0], G[0], P[0], C[0]);
   fourbitfull f2(A[7:4], B[7:4], C[0], S[7:4], G[1], P[1], C[1]);
   fourbitfull f3(A[11:8], B[11:8], C[1], S[11:8], G[2], P[2], C[2]);
   fourbitfull f4(A[15:12], B[15:12], C[2], S[15:12], G[3], P[3], Cout);
endmodule // adder16

   
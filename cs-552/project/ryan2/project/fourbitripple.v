module fourbitripple(A, B, Cin, S);
   input [3:0] A, B;
   input       Cin;
   output [3:0] S;
   wire [3:0] 	Carries;
 	
   onebitadder a1(A[0], B[0], Cin, S[0], Carries[0]);
   onebitadder a2(A[1], B[1], Carries[0], S[1], Carries[1]);
   onebitadder a3(A[2], B[2], Carries[1], S[2], Carries[2]);
   onebitadder a4(A[3], B[3], Carries[2], S[3], Carries[3]);
endmodule // fourbitripple

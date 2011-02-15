module fourbitlookahead (A, B, G, P);
   input[3:0] A, B;
   output     G, P;
   wire [3:0] gPartial, pPartial;

   onebitlookahead o1(A[0], B[0], gPartial[0], pPartial[0]);
   onebitlookahead o2(A[1], B[1], gPartial[1], pPartial[1]);
   onebitlookahead o3(A[2], B[2], gPartial[2], pPartial[2]);
   onebitlookahead o4(A[3], B[3], gPartial[3], pPartial[3]);

   assign P = pPartial[0] & pPartial[1] & pPartial[2] & pPartial[3];
   assign G = gPartial[3] | (gPartial[2] & pPartial[3]) | (gPartial[1] & pPartial[2] & pPartial[3]) | (gPartial[0] & pPartial[1] & pPartial[2] & pPartial[3]);
endmodule

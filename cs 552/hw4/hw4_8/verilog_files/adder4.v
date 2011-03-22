module adder4(A, B, SUM, CI, CO);
   input [3:0] A, B;
   input       CI;
   output      CO;   
   output [3:0] SUM;

   wire 	carry12, carry23, carry34;

   fulladder1 sub1(A[0], B[0], CI, SUM[0], carry12);
   fulladder1 sub2(A[1], B[1], carry12, SUM[1], carry23);
   fulladder1 sub3(A[2], B[2], carry23, SUM[2], carry34);
   fulladder1 sub4(A[3], B[3], carry34, SUM[3], CO);

endmodule

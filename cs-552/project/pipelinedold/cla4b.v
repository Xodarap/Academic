//Ryan Peeters
//ECE 552

module  cla4b(A, B, Cin, Sum, PG, GG, CintoMSB);
  
  input [3:0] A, B;
  input Cin;
  output [3:0] Sum;
  output PG, GG, CintoMSB;
  wire c1, c2, c3, Cout;
  wire p0, g0, p1, g1, p2, g2, p3, g3;
  
  assign p0 = A[0] ^ B[0];
  assign p1 = A[1] ^ B[1];
  assign p2 = A[2] ^ B[2];
  assign p3 = A[3] ^ B[3];
  
  assign g0 = A[0] & B[0];
  assign g1 = A[1] & B[1];
  assign g2 = A[2] & B[2];
  assign g3 = A[3] & B[3];
  
  assign c1 = g0 | (p0 & Cin);
  assign c2 = g1 | (p1 & c1);
  assign c3 = g2 | (p2 & c2);
    
  fulladder1 add0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(Sum[0]), .Cout(Cout));
  fulladder1 add1(.A(A[1]), .B(B[1]), .Cin(c1), .S(Sum[1]), .Cout(Cout));
  fulladder1 add2(.A(A[2]), .B(B[2]), .Cin(c2), .S(Sum[2]), .Cout(Cout));
  fulladder1 add3(.A(A[3]), .B(B[3]), .Cin(c3), .S(Sum[3]), .Cout(Cout));
  
  assign PG = p0 & p1 & p2 & p3;
  assign GG = (g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1));
  
  assign CintoMSB = c3;
  
  
endmodule

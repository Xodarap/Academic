module cla16b(A, B, Cin, Sum, Cout, PG, GG, CintoMSB);
  
  input [15:0] A, B;
  input Cin;
  output [15:0] Sum;
  output Cout, PG, GG, CintoMSB;
  wire c4, c8, c12, cMSB;
  wire p0, g0, p4, g4, p8, g8, p12, g12;
  
  
  assign c4 = g0 | (p0 & Cin);
  assign c8 = g4 | (p4 & c4);
  assign c12 = g8 | (p8 & c8);
  assign Cout = g12 | (p12 & c12);
        
  cla4b add0 (.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .Sum(Sum[3:0]), 
                      .PG(p0), .GG(g0), .CintoMSB(cMSB));
  cla4b add1 (.A(A[7:4]), .B(B[7:4]), .Cin(c4), .Sum(Sum[7:4]), 
                      .PG(p4), .GG(g4), .CintoMSB(cMSB));
  cla4b add2 (.A(A[11:8]), .B(B[11:8]), .Cin(c8), .Sum(Sum[11:8]), 
                      .PG(p8), .GG(g8), .CintoMSB(cMSB));
  cla4b add3 (.A(A[15:12]), .B(B[15:12]), .Cin(c12), .Sum(Sum[15:12]), 
                      .PG(p12), .GG(g12), .CintoMSB(CintoMSB));   
  
  assign PG = p0 & p4 & p8 & p12;
  assign GG = g12 | (g8 & p12) | (g4 & p12 & p8) | (g0 & p12 & p8 & p4);
  
endmodule
//Ryan Peeters
//ECE 552
//
//inverts A and adds 1 (computes two's complement)
//adds that with B to compute B-A

module sub16b(A, B, Out, ofl);
  input [15:0] A, B;
  output [15:0] Out;
  output ofl;
  wire foo, foo1;
  wire cout, cintomsb;
  
  //2's comp of b
  cla16b adder1(.A(~A), .B(B), .Cin(1'b1), .Sum(Out), .Cout(cout), .PG(foo), .GG(foo1), .CintoMSB(cintomsb));
  assign ofl = cout ^ cintomsb;

endmodule

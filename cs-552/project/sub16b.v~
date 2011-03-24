//Ryan Peeters
//ECE 552
//
//inverts the input and adds 1 (computes two's complement)

module sub16b(A, B, Out);
  input [15:0] A, B;
  output [15:0] Out;
  wire [15:0] B_twos;
  wire foo, foo1, foo2, foo3;
  wire foo4, foo5, foo6, foo7;
  
  //2's comp of b
  cla16b adder1(.A(~B), .B(16'b1), .Cin(1'b0), .Sum(B_twos), .Cout(foo), .PG(foo1), .GG(foo2), .CintoMSB(foo3));
  cla16b adder2(.A(A), .B(B_twos), .Cin(1'b0), .Sum(Out), .Cout(foo4), .PG(foo5), .GG(foo6), .CintoMSB(foo7));
  
endmodule
//Ryan Peeters
//ECE 552

module alu_tb;
  
  reg [15:0] A, B;
  reg invA, invB, Cin, sign;
  reg [3:0] Op;
  wire [15:0] Out;
  wire Ofl, Z, resultSign;
  
  alu aul1(.A(A), .B(B), .Cin(Cin), .Op(Op), .invA(invA), .invB(invB),
                 .sign(sign), .Out(Out), .Ofl(Ofl), .Z(Z), .resultSign(resultSign));
                 
  initial
  begin
  Cin = 1'b0;
  sign = 1'b0;
  //ROTATE/SHIFTS
  Op = 4'b0000;
  B = 16'h3434;
  A = 16'hf0f0;
  invA = 1'b1;  //test inverts
  invB = 1'b1;
  #200;
  invA = 1'b0;  //use non-inverted for simplicity
  invB = 1'b0;
  #200;
  Op = 4'b0001;
  #200;
  Op = 4'b0010;
  #200;
  Op = 4'b0011;
  #200;
  
  //LOGIC OPERATORS
  Op = 4'b0101;  //bitwise or
  #200;
  Op = 4'b0110;  //bitwise xor
  #200;
  Op = 4'b0111;  //bitwise and
  #200;
  
  
  /////////now test adder
  //UNSIGNED
  Op = 4'b0100;
  sign = 1'b0;  //unsigned
  A = 16'h1234;
  B = 16'h2345;  //regular unsigned addition
  #200;
  A = 16'hffff; //max unsigned value
  B = 16'h0000;
  #200;
  B = 16'h0001; //unsigned overflow
  #200;
  A = 16'hc350;
  B = 16'h15b3; //regular unsigned addition
  #200;
  
  //SIGNED
  sign = 1'b1;
  A = 16'h0112;
  B = 16'hdf34; //regular signed positive addition
  #200;
  A = 16'h7fff;  //max signed value
  B = 16'h0001; //signed positive overflow
  #200;         
  A = 16'hff32;
  B = 16'hc0a1;   //regular signed negative addition
  #200;
  A = 16'h8000;  //min signed value
  B = 16'hffff;  //signed negative overflow
  #200;
  
  Op = 4'b1000;
  #200;
  
  A = 16'h1234;
  Op = 4'b1011;
  #200;
  end
  
endmodule
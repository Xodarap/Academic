module alu (A, B, Cin, Op, invA, invB, sign, Out, Ofl, Z);
   input [15:0] A;
   input [15:0] B;
   input 	Cin;
   input [2:0]	Op;
   input 	invA;
   input 	invB;
   input 	sign;
   output [15:0] Out;
   output 	 Ofl;
   output 	 Z;
   wire [15:0] 	 Ai, Bi, O1, AddOut;
   reg [15:0] 	 tmp;
   reg 		 tmpOfl;
   wire 	 AddCout, SignedOfl;
   
   assign Ai = invA ? ~A : A;
   assign Bi = invB ? ~B : B;
   shifter s1(.In(Ai), .Cnt(Bi[3:0]), .Op(Op[1:0]), .Out(O1));
   adder16 a1(.A(Ai), .B(Bi), .Cin(Cin), .S (AddOut), .Cout (AddCout));
   // In signed addition, overflow can only occur if you add two negative
   // or two positive numbers. If that happens, the sign bit should be
   // zero.
   assign SignedOfl = (Ai[15] == Bi[15]) & (AddOut[15]);
      
   always @* case (Op)
	3'b0__: begin tmp = O1; tmpOfl = 0; end
	3'b100: begin 
	   tmp = AddOut;
	   tmpOfl = sign ? SignedOfl : AddCout;
	end
	3'b101: begin tmp = Ai | Bi; tmpOfl = 0; end
	3'b110: begin tmp = Ai ^ Bi; tmpOfl = 0; end
	3'b111: begin tmp = Ai & Bi; tmpOfl = 0; end
	default: $display("Error: incorrect Op in ALU");
   endcase // case (Op)
   
   assign Out = tmp;
   assign Ofl = tmpOfl;
   
   // It's zero if none of the bits are 1
   assign Z = ~(|Out);
endmodule

//Ryan Peeters
//ECE 552

module alu (A, B, Cin, Op, invA, invB, sign, Out, Ofl, Z, resultSign);

   input [15:0] A;
   input [15:0] B;
   input 	Cin;
   input [3:0]	Op;
   input 	invA;
   input 	invB;
   input 	sign;
   output [15:0] Out;
   output 	 Ofl;
   output 	 Z;
   output	resultSign;
   wire     Cout, PG, GG, CintoMSB;
   
   wire SignedOverflow;
   wire overflow;
   wire [15:0] out_shift, out_add, out_or, out_xor, 
                  out_and, mux4_out, out_btr, out_sub;
   
   wire [15:0] A_new, B_new; //Inverts A and B if needed
   assign A_new = invA? ~A: A;
   assign B_new = invB? ~B: B;
   
   //assign out_and = A + B
   cla16b adder(.A(A_new), .B(B_new), .Cin(Cin), .Sum(out_add), .Cout(Cout),
                         .PG(PG), .GG(GG), .CintoMSB(CintoMSB));
                         
    sub16b subtractor(.A(A_new), .B(B_new), .Out(out_sub));
    
    
  btr16b btr(.In(A_new), .Out(out_btr));
   assign out_xor = A ^ B;
   assign out_and = A & (~B);  
   
   //shift A by amount in B[3:0] according to Op[1:0]
   shifter shift1(.In(A_new), .Cnt(B_new[3:0]), .Op(Op[1:0]), 
                      .Out(out_shift));
   //select correct operation from: add, or, xor, and
   mux16b4_1 muxlogic (.InA(out_add), .InB(out_sub), .InC(out_xor),
                        .InD(out_and), .S(Op[1:0]), .Out(mux4_out));
   
   //Op[3:2] decides if output is from shifter, add/or/xor/and, or btr
   mux16b4_1 muxshift (.InA(out_shift), .InB(mux4_out), .InC(out_btr), 
          .InD(A_new), .S(Op[3:2]), .Out(Out));
							
	//assign sign of output
	assign resultSign = Out[15];	//1 = negative, 0 = positive
	
   //overflow from signed addition                            
   assign SignedOverflow = Cout ^ CintoMSB;
   //overflow from unsigned addition = Cout
   assign overflow = (~sign & Cout) | (sign & SignedOverflow);
   //if not doing addition (add Op = 0100), OFL = 0
   assign Ofl = (~Op[3] & Op[2] & ~Op[1] & ~Op[0])? overflow: 1'b0;
                            
   //if all bits of Out are zero Z = 1;                            
   assign Z = ~|(Out);
   

endmodule

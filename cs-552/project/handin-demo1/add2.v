// Increments the PC by 2
module add2(Pc, PcPrime);
   input [15:0] Pc;
   output [15:0] PcPrime;
   wire 	 foo;   // The compiler yells at us if we don't use outputs
   
   adder16 a16(.A(Pc), .B (16'd2), .Cin(1'b0), .S(PcPrime), .Cout(foo));
endmodule // add2

   
/*
   This module handles the conditional set instructions:
     SEQ, SLT, SLE, SCO
   Will do nothing if Control = 3'b0__
*/ 
module cond_set(In, Control, Zero, Ofl, Cout, Sign, Out);
   input [15:0] In;
   input [2:0] 	Control;
   input 	Zero, Ofl, Sign, Cout;
   output [15:0] Out;
   reg [15:0] 	 outTemp;
   

   // Control should be passed bits 13..11 of the instruction
   // Or 0__ if we don't need to do anything.
   always @* casex (Control)
      // Pass through: Do nothing
      3'b0xx: outTemp = In;
      // SEQ: If Rs - Rt = Zero, then set out = 1
      3'b100: outTemp = {15'b0, Zero};
      // SLT: If Rs - Rt < 0, out = 1
      3'b101: outTemp = {15'b0, ((~Sign & ~Ofl) | (Sign & Ofl)) & (~Zero) };
      // SLE: If Rs - Rt <= 0, out = 1
      3'b110: outTemp = {15'b0, Zero | (~Sign)};
      // SCO: If Rs + Rt causes carry out, out = 1
      3'b111: outTemp = {15'b0, Cout};
   endcase
	       
   assign Out = outTemp;
endmodule // cond_set

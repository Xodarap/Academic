module slbi(Rs, Imm, Out);
   input [15:0] Rs;
   input [15:0] 	Imm;
   output [15:0] Out;
   wire [15:0] 	 extImm;
   
   assign extImm = {8'b0, Imm[7:0]};   
   assign Out = (Rs << 4'd8) | extImm;
endmodule // slbi

   

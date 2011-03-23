module execute(Clk, Rst, Reg1, Reg2, Imm, AluSrc, AluOp, CondOp, Output);
   input Clk, Rst;
   input [15:0] Reg1, Reg2;
   input [15:0] Imm;
   input 	AluSrc;
   input [3:0] 	AluOp;
   input [2:0] 	CondOp;
   output [15:0] Output;

   wire [15:0] 	 aluInput2, aluOut;
   wire 	 ofl, z, resultSign;
      
   assign aluInput2 = AluSrc ? Imm : Reg1;
   alu alu0(.A(Reg1), .B(aluInput2), .Cin(0), .Op(AluOp), 
	    .invA(0), .invB(0), .sign(1), .Out(aluOut), 
	    .Ofl(ofl), .Z(z), .resultSign(resultSign));

   cond_set cond_set0(.In(aluOut), .Control(CondOp), .Zero(z), .Ofl(ofl), .Sign(resultSign), 
		      .Out(Output));
   
endmodule // execute

     
module execute(Clk, Rst, Reg1, Reg2, Imm, AluSrc, AluOp, CondOp, BranchCode, Output, PcSrc);
   input Clk, Rst;
   input [15:0] Reg1, Reg2;
   input [15:0] Imm;
   input 	AluSrc;
   input [3:0] 	AluOp;
   input [2:0] 	CondOp;
   input [2:0] 	BranchCode;
   
   output [15:0] Output;
   output 	 PcSrc;
   
   wire [15:0] 	 aluInput2, aluOut;
   wire 	 ofl, z, resultSign;
   wire 	 specBranch;
   
      
   assign aluInput2 = AluSrc ? Imm : Reg1;
   alu alu0(.A(Reg1), .B(aluInput2), .Cin(1'b0), .Op(AluOp), 
	    .invA(1'b0), .invB(1'b0), .sign(1'b1), .Out(aluOut), 
	    .Ofl(ofl), .Z(z), .resultSign(resultSign));

   cond_set cond_set0(.In(aluOut), .Control(CondOp), .Zero(z), .Ofl(ofl), .Sign(resultSign), 
		      .Out(Output));

   branchlogic branchlogic0(.branchCode(BranchCode), 
			    .A(Reg1), 
			    .Out(specBranch));
   assign PcSrc = BranchCode[2] & specBranch;
   
endmodule // execute

     
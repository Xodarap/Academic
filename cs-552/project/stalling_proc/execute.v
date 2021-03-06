module execute(Clk, Rst, Reg1, Reg2, Imm, AluSrc, AluOp, CondOp, Output, pcPlusTwo);
   input Clk, Rst;
   input [15:0] Reg1, Reg2;
   input [15:0] Imm;
   input 	AluSrc;
   input [3:0] 	AluOp;
   input [2:0] 	CondOp;
   input [15:0] pcPlusTwo;
   wire Cout;
   
   output [15:0] Output;
   
   wire [15:0] 	 aluInput2, aluOut;
   wire 	 ofl, z, resultSign;
   
      
   assign aluInput2 = AluSrc ? Imm : Reg2;

   alu alu0(.A(Reg1), .B(aluInput2), .Cin(1'b0), .Op(AluOp), 
	    .invA(1'b0), .invB(1'b0), .sign(1'b1), .Out(aluOut), 
	    .Ofl(ofl), .Z(z), .Cout(Cout), .resultSign(resultSign),
		.pcPlusTwo(pcPlusTwo));

   cond_set cond_set0(.In(aluOut), .Control(CondOp), .Zero(z), .Ofl(ofl), .Cout(Cout), .Sign(resultSign), 
			.Out(Output));
   
endmodule // execute

module execute(Clk, Rst, Reg1, Reg2, Imm, AluSrc, AluOp, CondOp, Output);
   input Clk, Rst;
   input [15:0] Reg1, Reg2;
   input [15:0] Imm;
   input 	AluSrc;
   input [3:0] 	AluOp;
   input [2:0] 	CondOp;
   output [15:0] Output;
   
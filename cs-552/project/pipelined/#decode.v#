module decode(Clk, Rst, Reg1, Reg2, Reg3, regToWriteTo, PcSrc, BranchCode,
		pc, imm, newPC, isJumpRegister, FReg1,
	      RegWrite, RegDest, WriteData, RegVal1, RegVal2, nxtRegToWriteTo);

   /* Reg1, Reg2 and Reg3 are purposefully vaguely named, because depending on
      the instruction type, they can be different things. Lookup table:
    
      Name | Instruction Ex | Meaning of Reg1, Reg2, Reg3  | Reg to write to
      I1     op Rd, Rs, imm   Rs, Rd, Unused                 Reg2/Rd (Except STU)
      I2     op Rs            Rs, Unused, Unused             Reg1/Rs
      R      op Rs, Rt, Rd    Rs, Rt, Rd                     Reg3/Rd
      J      op imm           Unused, Unused, Unused
    
   */

	wire err;
   input Clk, Rst, RegWrite;
   input [1:0] RegDest;
   input [2:0] Reg1, Reg2, Reg3;
   input [15:0] WriteData;
   input [2:0] BranchCode;
   input [15:0] pc, imm;
   input isJumpRegister;
      
   output [15:0] RegVal1, RegVal2;
   output [2:0]  nxtRegToWriteTo;
   output PcSrc;
   output [15:0] newPC;
   
   reg [2:0] 	 writeReg;
   input [2:0] 	 regToWriteTo;

	wire [15:0] JumpNewPc;
	wire [15:0] BranchNewPc;
   
   rf_bypass rf0(.read1data(RegVal1), .read2data(RegVal2), .clk(Clk), .rst(Rst),
		.read1regsel(Reg1), .read2regsel(Reg2), .err(err),
		.writeregsel(regToWriteTo), .writedata(WriteData), 
		.write(RegWrite)
                );
   
   always@(*) begin
      case(RegDest)
	2'b00:writeReg = Reg1;
	2'b01:writeReg = Reg2;
	2'b10:writeReg = Reg3;
	2'b11:writeReg = 3'b111;
      endcase
   end

   assign nxtRegToWriteTo = writeReg;

   branchlogic branchlogic0(.branchCode(BranchCode), 
			    .A(RegVal1), .Out(PcSrc));

//useless wires
   wire foo1, foo2, foo3, foo4;
   cla16b addjumpaddress(.A(imm), .B(RegVal1), .Cin(1'b0), .Sum(JumpNewPc), 
				.Cout(foo1), .PG(foo2), .GG(foo3), .CintoMSB(foo4));


   pc_plus2_plusimm calcbranchaddr(.pc(pc), .imm(imm), .branchAddr(BranchNewPc));
	
   assign newPC = isJumpRegister ? JumpNewPc : BranchNewPc;


endmodule // decode

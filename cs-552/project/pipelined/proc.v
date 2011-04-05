/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err, 
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output
   
   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in your statemachines
   
   
   /* your code here */
   
   /* Registers */
   wire regWrite;            // Is register file being written to, one bit signal (1 means yes, 0 means no)
   wire [2:0] DstwithJmout;  // The name of the register being written to. (3 bit signal)
   wire [15:0] wData;        // Data being written to the register. (16 bits)
   
   /* Memory */
   reg 	       notdonem;     // What's this?
   wire        memRxout;     // Mem being read?
   wire        memWxout;     // Mem being written?
   wire [15:0] memAddr;      // Address to access memory with (for both reads and writes to memory, 16 bits)
   wire [15:0] memWriteData; // Data to be written to memory for memory writes (16 bits)

   /* Control */
   /* Control -> Fetch */
   wire [2:0]  ctlBranchCode;
   
   /* Control -> Decode */
   wire        ctlRegWrite;
   wire [1:0]  ctlRegDest;

   /* Control -> Execute */
   wire 	ctlAluSrc;
   wire [3:0] 	ctlAluOp;
   wire [2:0] 	ctlCondOp;
   wire		isJump;
   wire		isJumpRegister;

   /* Control -> Memory */
   wire 	ctlMemWrite;
   wire 	ctlMemRead;

   /* Fetch -> Execute */
   wire	[15:0]	pcPlusTwo;

   /* Control -> Writeback */
   wire 	ctlMemToReg;
   
   /* Fetch -> Decode */
   wire [15:0] instruction;

   /* Decode -> Execute */
   wire [15:0] readData1, readData2,
	       immExtend;

   /* Execute -> Memory */
   wire [15:0] aluResult;

   /* Execute -> Fetch */
   wire        pcSrc;
   
   /* Memory -> Writeback */
   wire [15:0] memReadData;
      
   /* Writeback -> Decode */
   wire [15:0] regWriteData;
   
   /* Cache (Unused) */
   wire validCacheRead;      // Signal indicating a valid instruction read request to cache
   wire cacheHit;            // Signal indicating a valid instruction cache hit
   wire haltxout;            // Processor Halted

   /* Pipelining stuff */
   wire ctlRegWriteNext, Stall;
   wire [1:0] ctlRegDestNext;
   wire [2:0] ctlReg1Next, ctlReg2Next, ctlReg3Next;
   wire [15:0] WriteDataNext;
   
   fetch fetch0(.Clk(clk), .Rst(rst), .pcPlusTwo(pcPlusTwo),
		.Instruction(instruction), .Immediate(immExtend),
		.PcSrc(pcSrc|isJump|isJumpRegister), .regRS(readData1), .isJumpRegister(isJumpRegister));
   
   control control0(.instruction(instruction), 
	   .RegDst(ctlRegDest), 
	   .RegWrite(ctlRegWrite), 
	   .ALUSrc(ctlAluSrc), 
	   .MemRead(ctlMemRead), 
	   .MemWrite(ctlMemWrite),
	   .MemToReg(ctlMemToReg), 
	   .ALUOpcode(ctlAluOp), 
	   .Immediate(immExtend), 
	   .SetCode(ctlCondOp),
           .BranchCode(ctlBranchCode),
	   .isJumpRegister(isJumpRegister),
	   .isJump(isJump),
	   .err(err));

   fetch2decode f2b(.Clk(clk), .Rst(rst), .RegWriteIn(ctlRegWrite),
		    .RegDestIn(ctlRegDest), 
		    .Reg1In(instruction[10:8]), .Reg2In(instruction[7:5]), .Reg3In(instruction[4:2]),
		    .WriteDataIn(regWriteData), .Stall(1'b0), .Instruction(instruction),
		    /* Out */
		    .RegWriteOut(ctlRegWriteNext), .RegDestOut(ctlRegDestNext), 
		    .Reg1Out(ctlReg1Next), .Reg2Out(ctlReg2Next), .Reg3Out(ctlReg3Next),
		    .WriteDataOut(WriteDataNext)
		    );

   decode decode0(.Clk(clk), .Rst(rst),
		 .Reg1(ctlReg1Next), .Reg2(ctlReg2Next), .Reg3(ctlReg3Next),
		 .RegWrite(ctlRegWriteNext), .RegDest(ctlRegDestNext),
		 .WriteData(WriteDataNext),
		 .RegVal1(readData1),
		 .RegVal2(readData2));
   
   /*
   decode decode0(.Clk(clk), .Rst(rst), 
		  .Reg1(instruction[10:8]), .Reg2(instruction[7:5]), .Reg3(instruction[4:2]), 
		  .RegWrite(ctlRegWrite),         // If the value from Wb should be written
		  .RegDest(ctlRegDest),           // Rd = Reg1, Reg2 or Reg3?
		  .WriteData(regWriteData),    // Data from Wb to write
		  .RegVal1(readData1),         // Value of Reg1
		  .RegVal2(readData2));         // Value of Reg2
*/
   execute execute0(.Clk(clk), .Rst(rst), 
		    .Reg1(readData1),          
		    .Reg2(readData2), 
		    .Imm(immExtend), 
		    .AluSrc(ctlAluSrc), 
		    .AluOp(ctlAluOp), 
		    .CondOp(ctlCondOp),
		    .BranchCode(ctlBranchCode),
		    .Output(aluResult),
			.pcPlusTwo(pcPlusTwo),
		    .PcSrc(pcSrc));
   
   memory memory0(.Clk(clk), .Rst(rst), 
		  .Addr(aluResult), 
		  .Data(readData2), 
		  .MemWrite(ctlMemWrite), 
		  .MemRead(ctlMemRead), 
		  .ReadData(memReadData));
   
   writeback writeback0(.AluData(aluResult), 
			.MemoryData(memReadData), 
			.MemToReg(ctlMemToReg),
			.Halt(instruction[15:11] == 5'b0),
			.WriteData(regWriteData));
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

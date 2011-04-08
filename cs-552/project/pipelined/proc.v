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
   wire [35:0] controlSignals, ctlF2D, ctlD2E, ctlE2M;
   wire [31:0] d2ewire, d2mwire, aluwire;
   wire        pcSrcWire;
   wire [2:0]  reg2write2de, reg2write2em, reg2write2mw, reg2write2wd;
    wire [15:0] ALUResultm2wb, ReadDatam2wb, Instructionm2wb;
    wire [2:0] DestRegm2wb;
    wire RegWritem2wb, MemToRegm2wb;
   wire  instNull;
   
   
         
   fetch fetch0(.Clk(clk), .Rst(rst), .pcPlusTwo(pcPlusTwo),
		.Instruction(instruction), .Immediate(immExtend),
		.PcSrc(pcSrc|isJump|isJumpRegister), .regRS(readData1), .isJumpRegister(isJumpRegister));
   assign instNull = |instruction;
   
   control control0(.instruction(instruction), 
	   .RegDst(controlSignals[1:0]), 
	   .RegWrite(controlSignals[2]), 
	   .ALUSrc(controlSignals[3]), 
	   .MemRead(controlSignals[4]), 
	   .MemWrite(controlSignals[5]),
	   .MemToReg(controlSignals[6]), 
	   .ALUOpcode(controlSignals[10:7]), 
	   .Immediate(controlSignals[26:11]), 
	   .SetCode(controlSignals[29:27]),
           .BranchCode(controlSignals[32:30]),
	   .isJumpRegister(controlSignals[33]),
	   .isJump(controlSignals[34]),
	   .err(controlSignals[35]));

   fetch2decode f2d(.Clk(clk), .Rst(rst), .RegWriteIn(controlSignals[2]),
		    .RegDestIn(controlSignals[1:0]), 
		    .Reg1In(instruction[10:8]), .Reg2In(instruction[7:5]), .Reg3In(instruction[4:2]),
		    .WriteDataIn(regWriteData), .Stall(1'b0), .Instruction(instruction),
		    /* Out */
		    .RegWriteOut(ctlRegWriteNext), .RegDestOut(ctlRegDestNext), 
		    .Reg1Out(ctlReg1Next), .Reg2Out(ctlReg2Next), .Reg3Out(ctlReg3Next)
		    );

   control_ff control_ff0(.control_in(controlSignals), .clk(clk), .rst(rst),
			  .control_out(ctlF2D));
   
   decode decode0(.Clk(clk), .Rst(rst),
		 .Reg1(ctlReg1Next), .Reg2(ctlReg2Next), .Reg3(ctlReg3Next),
		 .regToWriteTo(reg2write2wd),
		 .RegWrite(ctlRegWriteNext), .RegDest(ctlRegDestNext),
		 .WriteData(regWriteData),
		 .RegVal1(d2ewire[15:0]),
		 .RegVal2(d2ewire[31:16]),
		 .nxtRegToWriteTo(reg2write2de));

   decode2execute d2e(.RegVal1(d2ewire[15:0]), .RegVal2(d2ewire[31:16]), .Reg2Write2(reg2write2de),
		      .Clk(clk), .Rst(rst), .Stall(1'b0),
		      .nextRV1(d2mwire[15:0]), .nextRV2(d2mwire[31:16]), .nxtReg2Write2(reg2write2em));

   control_ff control_ff1(.control_in(ctlF2D), .clk(clk), .rst(rst),
			  .control_out(ctlD2E));
      
   execute execute0(.Clk(clk), .Rst(rst), 
		    .Reg1(d2mwire[15:0]), //readData1),          
		    .Reg2(d2mwire[31:16]), //readData2), 
		    .Imm(ctlD2E[26:11]), //immExtend), 
		    .AluSrc(ctlD2E[3]), // ctlAluSrc  ), 
		    .AluOp(ctlD2E[10:7]),  //ctlAluOp), 
		    .CondOp(ctlD2E[29:27]),  //ctlCondOp),
		    .BranchCode(ctlD2E[32:30]), //ctlBranchCode),
		    .Output(aluwire),
		    .pcPlusTwo(pcPlusTwo),
		    .PcSrc(pcSrcWire));

   execute2memory e2m0(.AluOut(aluwire), .PcSrc(pcSrc), .RegVal1(d2mwire[15:0]), .RegVal2(d2mwire[31:16]),
		  .Reg2Write2(reg2write2em), .Clk(clk), .Rst(rst), .Stall(1'b0),
		  .nxtAluOut(aluResult), .nxtRV1(readData1), .nxtRV2(readData2), .nxtPcSrc(pcSrc),
		       .nxtReg2Write2(reg2write2mw));
      
   control_ff control_ff2(.control_in(ctlD2E), .clk(clk), .rst(rst),
			  .control_out({err,
					isJump,
					isJumpRegister,
					ctlBranchCode,
					ctlCondOp,
					immExtend,
					ctlAluOp,
					ctlMemToReg,
					ctlMemWrite,
					ctlMemRead,
					ctlAluSrc,
					ctlRegWrite,
					ctlRegDest})					
			   );
      
   memory memory0(.Clk(clk), .Rst(rst), 
		  .Addr(aluResult), 
		  .Data(readData2), 
		  .MemWrite(ctlMemWrite), 
		  .MemRead(ctlMemRead), 
		  .ReadData(memReadData));
   
    memory2writeback m2wb (.Clk(clk), .Rst(rst),
            .RegWriteIn(ctlRegWrite), .ReadDataIn(memReadData), .ALUResultIn(aluResult),
            .DestRegIn(reg2write2mw), .MemToRegIn(ctlMemToReg), .InstructionIn(16'b0),
            .RegWriteOut(RegWritem2wb), .ReadDataOut(ReadDatam2wb),
            .ALUResultOut(ALUResultm2wb), .DestRegOut(reg2write2wd),
            .MemToRegOut(MemToRegm2wb), .InstructionOut(Instructionm2wb));
   
   writeback writeback0(.AluData(ALUResultm2wb), 
			.MemoryData(ReadDatam2wb), 
			.MemToReg(MemToRegm2wb),
			.Halt((Instructionm2wb[15:11] == 5'b0)),
			.WriteData(regWriteData));
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

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
   /* Control -> Decode */
   wire        ctlRegWrite;
   wire [1:0]  ctlRegDest;

   /* Control -> Execute */
   wire 	ctlAluSrc;
   wire [3:0] 	ctlAluOp;
   wire [2:0] 	ctlCondOp;

   /* Control -> Memory */
   wire 	ctlMemWrite;
   wire 	ctlMemRead;
   
   /* Fetch -> Decode */
   wire [15:0] instruction;

   /* Decode -> Execute */
   wire [15:0] readData1, readData2,
	       immExtend, jExtend;

   /* Execute -> Memory */
   wire [15:0] aluResult;

   /* Memory -> Writeback */
   wire [15:0] memReadData;
      
   /* Writeback -> Decode */
   wire [15:0] regWriteData;
   
   /* Cache (Unused) */
   wire validCacheRead;      // Signal indicating a valid instruction read request to cache
   wire cacheHit;            // Signal indicating a valid instruction cache hit
   wire haltxout;            // Processor Halted
   
   fetch fetch0(.Clk(clk), .Rst(rst), .NewPc(0), .Instruction(instruction));
   decode decode0(.Clk(clk), .Rst(rst), 
		  .Reg1(instruction[10:8]), .Reg2(instruction[7:5]), .Reg3(instruction[4:2]), 
		  .Imm(instruction[7:0]),      // The I in I-type
		  .Address(instruction[10:0]), // The J in J-type
		  .RegWrite(ctlRegWrite),         // If the value from Wb should be written
		  .RegDest(ctlRxegDest),           // Rd = Reg1, Reg2 or Reg3?
		  .WriteData(regWriteData),    // Data from Wb to write
		  .RegVal1(readdata1),         // Value of Reg1
		  .RegVal2(readdata2),         // Value of Reg2
	          .ImmExt(immExtend),          // Imm value extended
		  .AddressExt(jExtend));       // J value extended

   execute execute0(.Clk(clk), .Rst(rst), 
		    .Reg1(readdata1),          
		    .Reg2(readdata2), 
		    .Imm(immExtend), 
		    .AluSrc(ctlAluSrc), 
		    .AluOp(ctlAluOp), 
		    .CondOp(ctlCondOp), 
		    .Output(aluResult));
   
   memory memory0(.Clk(clk), .Rst(rst), 
		  .Addr(aluResult), 
		  .Data(readdata2), 
		  .MemWrite(ctlMemWrite), 
		  .MemRead(ctlMemRead), 
		  .ReadData(memReadData));   
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:

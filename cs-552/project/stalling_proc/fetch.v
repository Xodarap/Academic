// Holds the info for the Fetch stage
module fetch(Clk, Rst, PcSrc, Immediate, Instruction, pcPlusTwo, regRS, isJumpRegister, newPC, pc, Stall, StallOut);

   input Clk, Rst, PcSrc;
	input [15:0]	Immediate;
	input isJumpRegister, Stall;
	input [15:0]	regRS;
	input [15:0] newPC;
	output [15:0]	Instruction;
	output [15:0] pcPlusTwo;	//PC + 2
	output StallOut;

   output [15:0] pc;           // PC
   wire [15:0] foo;          // Instruction to write
   wire [15:0] nextPc;   

   wire [15:0] realPC;
   

   assign realPC = PcSrc ? newPC: pc;

   wire Done, CacheHit, Err;
/* -----\/----- EXCLUDED -----\/-----

   stallmem instruction_memory(
			.DataOut	(Instruction),
		    	.Done		(Done),
		    	.Stall		(StallOut),
		    	.CacheHit	(CacheHit),
		    	.err		(Err),
		    	// Inputs
		    	.DataIn		(foo),
		    	.Addr		(realPC),
		    	.Wr		(1'b0),
		    	.Rd		(1'b1),
		    	.createdump	(1'b0),
		    	.clk		(Clk),
		    	.rst		(Rst));
 -----/\----- EXCLUDED -----/\----- */
   memory2c instruction_memory(.data_out(Instruction),
				  .data_in(foo), // We never write instructions
				  .addr(pc),
				  .enable(1'b1),
				  .wr(1'b0), // We never write instructions
				  .createdump(1'b0),
				  .clk(Clk),
				  .rst(Rst));
   assign StallOut = 1'b0;
   
   add2 pcIncrementer(.Pc (realPC), .PcPrime (pcPlusTwo));

   assign nextPc = PcSrc ? newPC : pcPlusTwo;
   
   reg16 r16(.readdata(pc), .clk(Clk), .rst(Rst), .writedata(nextPc), .write(~Stall));
endmodule // fetch

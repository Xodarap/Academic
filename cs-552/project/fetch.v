// Holds the info for the Fetch stage
module fetch(Clk, Rst, PcSrc, Immediate, Instruction);
   input Clk, Rst, PcSrc;
	input [15:0]	Immediate;
   output [15:0]	Instruction;
   
	wire [15:0] NewPc;
   wire [15:0] pc;           // PC
   wire [15:0] foo;          // Instruction to write
   wire [15:0] pcPlusTwo;    // PC + 2
   wire [15:0] nextPc;   
   
	pc_plus2_plusimm calcbranchaddr(.pc(pc), .imm(Immediate), .branchAddr(NewPc));

   memory2c instruction_memory(.data_out(Instruction), 
			       .data_in(foo),          // We never write instructions
			       .addr(pc), 
			       .enable(1'b1), 
			       .wr(1'b0),                 // We never write instructions
			       .createdump(1'b0), 
			       .clk(Clk), 
			       .rst(Rst));
   add2 pcIncrementer(.Pc (pc), .PcPrime (pcPlusTwo));
   assign nextPc = PcSrc ? NewPc : pcPlusTwo;
   reg16 r16(.readdata(pc), .clk(Clk), .rst(Rst), .writedata(nextPc), .write(1'b1));   
endmodule // fetch

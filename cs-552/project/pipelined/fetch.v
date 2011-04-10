// Holds the info for the Fetch stage
module fetch(Clk, Rst, PcSrc, Immediate, Instruction, pcPlusTwo, regRS, isJumpRegister);
   input Clk, Rst, PcSrc;
	input [15:0]	Immediate;
	input isJumpRegister;
	input [15:0]	regRS;
   output [15:0]	Instruction;
	output [15:0] pcPlusTwo;	//PC + 2
	wire [15:0] JumpNewPc;
	wire [15:0] BranchNewPc;
   wire [15:0] pc;           // PC
   wire [15:0] foo;          // Instruction to write
   wire [15:0] nextPc;   
	wire [15:0] NewPc;

//useless wires
	wire foo1, foo2, foo3, foo4;
   

	cla16b addjumpaddress(.A(Immediate), .B(regRS), .Cin(1'b0), .Sum(JumpNewPc), 
					.Cout(foo1), .PG(foo2), .GG(foo3), .CintoMSB(foo4));

	pc_plus2_plusimm calcbranchaddr(.pc(pc), .imm(Immediate), .branchAddr(BranchNewPc));

   memory2c instruction_memory(.data_out(Instruction), 
			       .data_in(foo),          // We never write instructions
			       .addr(pc), 
			       .enable(1'b1), 
			       .wr(1'b0),                 // We never write instructions
			       .createdump(1'b0), 
			       .clk(Clk), 
			       .rst(Rst));
   add2 pcIncrementer(.Pc (pc), .PcPrime (pcPlusTwo));
	
	assign NewPc = isJumpRegister ? JumpNewPc : BranchNewPc;

   assign nextPc = PcSrc ? NewPc : pcPlusTwo;
   
   reg16 r16(.readdata(pc), .clk(Clk), .rst(Rst), .writedata(nextPc), .write(1'b1));   
endmodule // fetch

module tb_control;

	reg [15:0] instruction;
	wire [3:0] ALUOpcode;
	wire [2:0] SetCode;
	wire [1:0] RegDst;
	wire RegWrite, ALUSrc, PCSrc, MemRead, MemWrite, MemToReg, ImmSrc;
	wire err;
	
	control ctrl(.instruction(instruction), .RegDst(RegDst), .RegWrite(RegWrite), 
				.ALUSrc(ALUSrc), .PCSrc(PCSrc), .MemRead(MemRead), .MemWrite(MemWrite),
                .MemToReg(MemToReg), .ALUOpcode(ALUOpcode), .ImmSrc(ImmSrc), 
				.SetCode(SetCode), .err(err));
				
	initial begin
	//SPECIAL
		//HALT
		instruction = 16'b00000_10101010101;
		#50;
		//NOP
		instruction = 16'b00001_10101010101;
		#50;
		
	//ARITHMETIC IMMEDIATE
		//ADDI
		instruction = 16'b01000_101_010_10101;
		#50;
		//SUBI
		instruction = 16'b01001_101_010_10101;
		#50;
		//XORI
		instruction = 16'b01010_101_010_10101;
		#50;
		//ANDNI
		instruction = 16'b01011_101_010_10101;
		#50;
		
	//ROTATE/SHIFT IMMEDIATE
		//ROLI
		instruction = 16'b10100_101_010_10101;
		#50;
		//SLLI
		instruction = 16'b10101_101_010_10101;
		#50;
		//RORI
		instruction = 16'b10110_101_010_10101;
		#50;
		//SRLI
		instruction = 16'b10111_101_010_10101;
		#50;
		
	//LOAD/STORE
		//ST
		instruction = 16'b10000_101_010_10101;
		#50;
		//LD
		instruction = 16'b10001_101_010_10101;
		#50;
		//STU
		instruction = 16'b10011_101_010_10101;
		#50;
		
	//ARITHMETIC	
		//BTR
		instruction = 16'b11001_101_010_101_01;
		#50;
		//ADD
		instruction = 16'b11011_101_010_101_00;
		#50;
		//SUB
		instruction = 16'b11011_101_010_101_01;
		#50;
		//XOR
		instruction = 16'b11011_101_010_101_10;
		#50;
		//ANDN
		instruction = 16'b11011_101_010_101_11;
		#50;
		
	//ROTATE/SHIFT
		//ROL
		instruction = 16'b11010_101_010_101_00;
		#50;
		//SLL
		instruction = 16'b11010_101_010_101_01;
		#50;
		//ROR
		instruction = 16'b11010_101_010_101_10;
		#50;
		//SRL
		instruction = 16'b11010_101_010_101_11;
		#50;
		
	//SET
		//SEQ
		instruction = 16'b11100_101_010_101_01;
		#50;
		//SLT
		instruction = 16'b11101_101_010_101_10;
		#50;
		//SLE
		instruction = 16'b11110_101_010_101_11;
		#50;
		//SCO
		instruction = 16'b11111_101_010_101_11;
		#50;
		
	//BRANCH
	end

endmodule
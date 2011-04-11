//Ryan Peeters
//ECE 552
//
//Processor control logic

module control(instruction, RegDst, RegWrite, ALUSrc, MemRead, MemWrite,
                     MemToReg, ALUOpcode, Immediate, SetCode, BranchCode, isJump, isJumpRegister, err);
  input [15:0] instruction;
  wire [4:0] opcode;
  output reg ALUSrc, MemRead, MemWrite, MemToReg, RegWrite;
  output reg [3:0] ALUOpcode;
  output reg [1:0] RegDst;
  output reg [2:0] BranchCode;
  output reg [2:0] SetCode;
  output reg [15:0] Immediate;
  output reg isJump;
  output reg isJumpRegister;
  output reg err;
   
  assign opcode = instruction[15:11];
  
  always@(*)begin
     err = 0;
     
    casex(opcode)
      //HALT
      5'b00000:begin
	 	RegWrite = 1'b0;
    	 	MemWrite = 1'b0;
	 	SetCode = 3'b000;
	 	BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	 MemRead = 1'b0;
	 
      end
      
      //NOP
      5'b00001:begin
        	//RegDst = 2'bxx;
        	//RegWrite = 1'b0;
	 	RegWrite = 1'b0;
	 
        	//ALUSrc = 1'bx;
        	MemWrite = 1'b0;
       	 	MemRead = 1'b0;
        	//MemToReg = 1'bx;
        	//ImmSrc = 1'bx;
        	//ALUOpcode = 4'bxxxx;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
      
      //ADDI, SUBI
      5'b0100x:begin
        	RegDst = 2'b01;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	Immediate = {{11{instruction[4]}}, instruction[4:0]};
        	ALUOpcode = {2'b01, opcode[1:0]};
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end

      //XORI, ANDNI
      5'b0101x:begin
        	RegDst = 2'b01;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	Immediate = {11'b0, instruction[4:0]};
        	ALUOpcode = {2'b01, opcode[1:0]};
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
      
      //ROLI, SLLI, RORI, SRLI
      5'b101xx:begin
        	RegDst = 2'b01;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	Immediate = {12'b0, instruction[3:0]};
        	ALUOpcode = {2'b00, opcode[1:0]};
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
      
	//ST
      5'b10000:begin
		//RegDst = 
        	RegWrite = 1'b0;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b1;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	Immediate = {{11{instruction[4]}}, instruction[4:0]};
        	ALUOpcode = 4'b0100;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;	  
	  end

      //LD
      5'b10001:begin
		RegDst = 2'b01;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b0;
        	MemRead = 1'b1;
        	MemToReg = 1'b1;
        	Immediate = {{11{instruction[4]}}, instruction[4:0]};
        	ALUOpcode = 4'b0100;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	 end

      //STU
      5'b10011:begin
		RegDst = 2'b00;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b1;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	Immediate = {{11{instruction[4]}}, instruction[4:0]};
        	ALUOpcode = 4'b0100;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	end
      
	  //BTR
      5'b11001:begin
        	RegDst = 2'b10;
		RegWrite = 1'b1;
        	//ALUSrc = 1'bx;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	//ALUOpcode = 4'b10xx;
		ALUOpcode = 4'b1000;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
      
	  //ADD, SUB, XOR, ANDN
      5'b11011:begin
        	RegDst = 2'b10;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b0;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	//ImmSrc = 1'bx;
        	ALUOpcode = {2'b01, instruction[1:0]};
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
	  
	  //ROL, SLL, ROR, SRL
      5'b11010:begin
        	RegDst = 2'b10;
        	RegWrite = 1'b1;
        	ALUSrc = 1'b0;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
        	//ImmSrc = 1'bx;
        	ALUOpcode = {2'b00, instruction[1:0]};
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
      end
	  
	  //SEQ, SLE
	  5'b111x0:begin
		RegDst = 2'b10;
		RegWrite = 1'b1;
        	ALUSrc = 1'b0;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
		SetCode = instruction[13:11];	//for set condition logic
        	ALUOpcode = 4'b0101;	//subtraction
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end

	//SLT
	  5'b11101:begin
		RegDst = 2'b10;
		RegWrite = 1'b1;
        	ALUSrc = 1'b0;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
		SetCode = instruction[13:11];	//for set condition logic
        	ALUOpcode = 4'b0101;	//subtract
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end

	//SCO
	  5'b11111:begin
		RegDst = 2'b10;
		RegWrite = 1'b1;
        	ALUSrc = 1'b0;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
		SetCode = instruction[13:11];	//for set condition logic
        	ALUOpcode = 4'b0100;	//add
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end
	  
	  	//BEQ, BNEZ, BLTZ, BGEZ
	  	5'b011xx:begin
		//RegDst = 2'bxx;
		RegWrite = 1'b0;
        	//ALUSrc = 1'bx;
        	MemWrite = 1'b0;
       	 	MemRead = 1'b0;
       	 	//MemToReg = 1'bx;
                Immediate = {{8{instruction[7]}}, instruction[7:0]};
        	//ALUOpcode = 4'bxxxx;
		SetCode = 3'b000;
		BranchCode = opcode[2:0];
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end
	  
	  //LBI
	  5'b11000:begin
		RegDst = 2'b00;
		RegWrite = 1'b1;
        	ALUSrc = 1'b1;
        	MemWrite = 1'b0;
        	MemRead = 1'b0;
        	MemToReg = 1'b0;
                Immediate = {{8{instruction[7]}}, instruction[7:0]};
        	ALUOpcode = 4'b1100;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end
	  
	  //SLBI
	  5'b10010:begin
	     RegDst = 2'b00;
	     RegWrite = 1'b1;
	     ALUSrc = 1'b1;
	     MemWrite = 1'b0;
	     MemRead = 1'b0;
             MemToReg = 1'b0;
             Immediate = {{8{instruction[7]}}, instruction[7:0]};
             ALUOpcode = 4'b1110;
	     SetCode = 3'b000;
	     BranchCode = 3'b000;
		isJump = 1'b0;
		isJumpRegister = 1'b0;
	  end
	  
//J and JAL
	5'b001x0:begin
		RegDst = 2'b11;
		RegWrite = instruction[12];
		ALUSrc = 1'b1;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemToReg = 1'b0;
		Immediate = {{5{instruction[10]}}, instruction[10:0]};
		ALUOpcode = 4'b1111;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b1;
		isJumpRegister = 1'b0;
	end

//JR and JALR
	5'b001x1:begin
		RegDst = 2'b11;
		RegWrite = instruction[12];
		ALUSrc = 1'b1;
		MemWrite = 1'b0;
		MemRead = 1'b0;
		MemToReg = 1'b0;
		Immediate = {{8{instruction[7]}}, instruction[7:0]};
		ALUOpcode = 4'b1111;
		SetCode = 3'b000;
		BranchCode = 3'b000;
		isJump = 1'b1;
		isJumpRegister = 1'b1;
	end
	  
      //should never happen in finished program
      default:begin
        err = 1'b1;
      end
    
    endcase
  end // always@ (*)
   
endmodule

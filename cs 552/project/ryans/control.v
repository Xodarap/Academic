//Ryan Peeters
//ECE 552
//
//Processor control logic

module control(instruction, RegDst, RegWrite, ALUSrc, PCSrc, MemRead, MemWrite,
                     MemToReg, ALUOpcode, ImmSrc, SetCode, err);
  input [15:0] instruction;
  wire [4:0] opcode;
  output reg RegWrite, ALUSrc, PCSrc, MemRead, MemWrite, MemToReg, ImmSrc;
  output reg [3:0] ALUOpcode;
  output reg [1:0] RegDst;
  output reg [2:0] SetCode;
  output reg err;
  
  assign opcode = instruction[15:11];
  
  always@(*)begin
    casex(opcode)
      //HALT
      5'b00000:begin
         $finish;
	 
      end
      
      //NOP
      5'b00001:begin
        
      end
      
      //ADDI, SUBI, XORI, ANDNI
      5'b010xx:begin
        RegDst = 2'b01;
        RegWrite = 1'b1;
        ALUSrc = 1'b1;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        ImmSrc = ~opcode[1];
	SetCode = 3'b000;
        ALUOpcode = {2'b01, opcode[1:0]};
      end
      
      //ROLI, SLLI, RORI, SRLI
      5'b101xx:begin
        RegDst = 2'b01;
        RegWrite = 1'b1;
        ALUSrc = 1'b1;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        //ImmSrc = 1'bx; 
		SetCode = 3'b000;
        ALUOpcode = {2'b00, opcode[1:0]};
      end
      
      5'b10000:begin
	  
	  end
      
      5'b10001:begin
	  
	  end
      
      5'b10011:begin
	  
	  end
      
	  //BTR
      5'b11001:begin
        RegDst = 2'b10;
		RegWrite = 1'b1;
        //ALUSrc = 1'bx;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        //ImmSrc = 1'bx;
        //ALUOpcode = 4'b10xx;
		SetCode = 3'b000;
		ALUOpcode = 4'b1000;
      end
      
	  //ADD, SUB, XOR, ANDN
      5'b11011:begin
        RegDst = 2'b10;
        RegWrite = 1'b1;
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        //ImmSrc = 1'bx;
		//SetCode = 3'bxxx;
        ALUOpcode = {2'b01, instruction[1:0]};
      end
	  
	  //ROL, SLL, ROR, SRL
      5'b11010:begin
        RegDst = 2'b10;
        RegWrite = 1'b1;
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        //ImmSrc = 1'bx;
		//SetCode = 3'bxxx;
        ALUOpcode = {2'b00, instruction[1:0]};
      end
	  
	  //SEQ, SLT, SLE, SCO
	  5'b111xx:begin
		RegDst = 2'b10;
		RegWrite = 1'b1;
        ALUSrc = 1'b0;
        MemWrite = 1'b0;
        MemRead = 1'b0;
        MemToReg = 1'b0;
        PCSrc = 1'b0;
        //ImmSrc = 1'bx;
		SetCode = opcode[2:0];	//for set condition logic
        ALUOpcode = 4'b0101;	//subtraction
	  end
	  
	  //BEQ, BNEZ, BLTZ, BGEZ
      /*
	  5'b111xx:begin
		RegDst =
		RegWrite = 
        ALUSrc = 
        MemWrite = 
        MemRead = 
        MemToReg = 
        PCSrc = 
        ImmSrc = 
		SetCode = 
        ALUOpcode = 
	  end
	*/  
      //should never happen
      default:begin
        err = 1'b1;
      end
    
    endcase
  end
endmodule
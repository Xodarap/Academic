module memory2writeback(Clk, Rst, 
			RegWriteIn, ReadDataIn, ALUResultIn, DestRegIn, MemToRegIn, InstructionIn, Stall,
			RegWriteOut, ReadDataOut, ALUResultOut, DestRegOut, MemToRegOut, InstructionOut);

	input Clk, Rst, RegWriteIn, MemToRegIn;
	input [15:0] ReadDataIn, ALUResultIn, InstructionIn;
	input [2:0] DestRegIn;
	input Stall;
   
	output RegWriteOut, MemToRegOut;
	output [15:0] ReadDataOut, ALUResultOut, InstructionOut;
	output [2:0] DestRegOut;
   
   wire [10:0] 	     garbage;
   
	
	reg16 readData(.clk(Clk), .rst(Rst), .write(~Stall), .readdata(ReadDataOut), .writedata(ReadDataIn));
	reg16 ALUData(.clk(Clk), .rst(Rst), .write(~Stall), .readdata(ALUResultOut), .writedata(ALUResultIn));
	reg16 instruction(.clk(Clk), .rst(Rst), .write(~Stall), .readdata(InstructionOut), .writedata(InstructionIn));
	reg16 writeAndDest(.clk(Clk), .rst(Rst), .write(~Stall), 
				.readdata({garbage, MemToRegOut, DestRegOut, RegWriteOut}),
				.writedata({11'b0, MemToRegIn, DestRegIn, RegWriteIn}));

endmodule

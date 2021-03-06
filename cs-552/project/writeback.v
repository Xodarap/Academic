module writeback(AluData, MemoryData, MemToReg, Halt, WriteData);
   input [15:0] AluData, MemoryData;
   input 	MemToReg;
   input 	Halt;   // Halt doesn't actually do anything except signal to the testbench to halt
   
   output 	[15:0] WriteData;

   assign WriteData = MemToReg ? MemoryData : AluData;
endmodule

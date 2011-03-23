module writeback(AluData, MemoryData, MemToReg, Halt, WriteData);
   input [15:0] AluData, MemoryData;
   input 	MemToReg;
   input 	Halt;   // Halt doesn't actually do anything except signal to the testbench to halt
   
   output 	WriteData;

   assign WriteData = MemToReg ? MemToReg : AluData;
endmodule
module writeback(AluData, MemoryData, MemToReg, WriteData);
   input [15:0] AluData, MemoryData;
   input 	MemToReg;
   output 	WriteData;

   assign WriteData = MemToReg ? MemToReg : AluData;
endmodule
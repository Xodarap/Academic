module decode(Clk, Rst, Reg1, Reg2, Reg3, 
	      RegWrite, RegDest, WriteData, RegVal1, RegVal2);

   /* Reg1, Reg2 and Reg3 are purposefully vaguely named, because depending on
      the instruction type, they can be different things. Lookup table:
    
      Name | Instruction Ex | Meaning of Reg1, Reg2, Reg3  | Reg to write to
      I1     op Rd, Rs, imm   Rs, Rd, Unused                 Reg2/Rd (Except STU)
      I2     op Rs            Rs, Unused, Unused             Reg1/Rs
      R      op Rs, Rt, Rd    Rs, Rt, Rd                     Reg3/Rd
      J      op imm           Unused, Unused, Unused
    
   */


   input Clk, Rst, RegWrite;
   input [1:0] RegDest;
   input [2:0] Reg1, Reg2, Reg3;
   input [15:0] WriteData;
      
   output [15:0] RegVal1, RegVal2;

   wire [2:0] 	 regToWriteTo;
   
   rf_hier rf0(.read1data(RegVal1), .read2data(RegVal2), 
		.read1regsel(Reg1), .read2regsel(Reg2), 
		.writeregsel(regToWriteTo), .writedata(WriteData), 
		.write(RegWrite)
                );
   
   assign regToWriteTo = (RegDest == 1'b0) ? Reg1 : 
			 (RegDest == 1'b1) ? Reg2 :
			                     Reg3;
endmodule // decode

module decode(Clk, Rst, Reg1, Reg2, Reg3, regToWriteTo,
	      RegWrite, RegDest, WriteData, RegVal1, RegVal2, nxtRegToWriteTo);

   /* Reg1, Reg2 and Reg3 are purposefully vaguely named, because depending on
      the instruction type, they can be different things. Lookup table:
    
      Name | Instruction Ex | Meaning of Reg1, Reg2, Reg3  | Reg to write to
      I1     op Rd, Rs, imm   Rs, Rd, Unused                 Reg2/Rd (Except STU)
      I2     op Rs            Rs, Unused, Unused             Reg1/Rs
      R      op Rs, Rt, Rd    Rs, Rt, Rd                     Reg3/Rd
      J      op imm           Unused, Unused, Unused
    
   */

	wire err;
   input Clk, Rst, RegWrite;
   input [1:0] RegDest;
   input [2:0] Reg1, Reg2, Reg3;
   input [15:0] WriteData;
      
   output [15:0] RegVal1, RegVal2;
   output [2:0]  nxtRegToWriteTo;
   
   reg [2:0] 	 writeReg;
   input [2:0] 	 regToWriteTo;
   
   rf_bypass rf0(.read1data(RegVal1), .read2data(RegVal2), .clk(Clk), .rst(Rst),
		.read1regsel(Reg1), .read2regsel(Reg2), .err(err),
		.writeregsel(regToWriteTo), .writedata(WriteData), 
		.write(RegWrite)
                );
	always@(*) begin
	case(RegDest)
		2'b00:writeReg = Reg1;
		2'b01:writeReg = Reg2;
		2'b10:writeReg = Reg3;
		2'b11:writeReg = 3'b111;
	endcase
	end

   assign nxtRegToWriteTo = writeReg;
endmodule // decode

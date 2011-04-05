module fetch2decode(Clk, Rst, RegWriteIn,
		    RegDestIn, Reg1In, Reg2In, Reg3In,
		    WriteDataIn, Stall, Instruction,
		    /* Out */
		    RegWriteOut,
		    RegDestOut, Reg1Out, Reg2Out, Reg3Out,
		    WriteDataOut
		    );

   input Clk, Rst, RegWriteIn, Stall;
   input [1:0] RegDestIn;
   input [2:0] Reg1In, Reg2In, Reg3In;
   input [15:0] WriteDataIn, Instruction;
   output 	RegWriteOut;
   output [1:0] RegDestOut;
   output [2:0] Reg1Out, Reg2Out, Reg3Out;
   output [15:0] WriteDataOut;
   
   wire [3:0] 	foo;
   wire [15:0] 	nextInstruction;
      
   
   reg16 controlSignals(
			/* We only use the 12 lowest bits */
			.writedata({4'b0, RegWriteIn, RegDestIn, Reg1In, Reg2In, Reg3In}), 
			.clk(Clk), .rst(Rst), 
			.readdata({foo, RegWriteOut, RegDestOut, Reg1Out, Reg2Out, Reg3Out}), 
			.write(1'b1));
//~Stall));
   reg16 writeData(.readdata(WriteDataOut), .clk(Clk), .rst(Rst), .writedata(WriteDataIn), .write(1'b1));
   reg16 instruction(.readdata(nextInstruction), .clk(Clk), .rst(Rst), .writedata(Instruction), .write(1'b1));
   
endmodule // fetch2decode

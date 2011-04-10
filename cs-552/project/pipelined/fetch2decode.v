module fetch2decode(Clk, Rst,
		    RegDestIn, Reg1In, Reg2In, Reg3In,
		    Stall, Instruction,
		    /* Out */		    
		    RegDestOut, Reg1Out, Reg2Out, Reg3Out
		    );

   input Clk, Rst, Stall;
   input [1:0] RegDestIn;
   input [2:0] Reg1In, Reg2In, Reg3In;
   input [15:0] Instruction;
   output [1:0] RegDestOut;
   output [2:0] Reg1Out, Reg2Out, Reg3Out;
   
   wire [4:0] 	foo;
   wire [15:0] 	nextInstruction;   
   
   reg16 controlSignals(
			/* We only use the 12 lowest bits */
			.writedata({5'b0, RegDestIn, Reg1In, Reg2In, Reg3In}), 
			.clk(Clk), .rst(Rst), 
			.readdata({foo, RegDestOut, Reg1Out, Reg2Out, Reg3Out}), 
			.write(~Stall));
   reg16 instruction(.readdata(nextInstruction), .clk(Clk), .rst(Rst), .writedata(Instruction), .write(~Stall));
   
endmodule // fetch2decode

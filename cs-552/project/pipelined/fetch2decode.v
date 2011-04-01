module fetch2decode(Clk, Rst, RegWriteIn,
		    RegDestIn, Reg1In, Reg2In, Reg3In,
		    WriteDataIn, Stall,
		    /* Out */
		    RegWriteOut,
		    RegDestOut, Reg1Out, Reg2Out, Reg3Out,
		    WriteDataOut
		    );

   input Clk, Rst, RegWrite, Stall;
   input [1:0] RegDest;
   input [2:0] Reg1, Reg2, Reg3;
   input [15:0] WriteData;
   wire [3:0] 	foo;
   
   reg16 controlSignals(
			/* We only use the 12 lowest bits */
			.readdata({4'b0, RegWriteIn, RegDestIn, Reg1In, Reg2In, Reg3In}, 
			.clk(Clk), .rst(Rst), 
			.writedata({foo, RegWriteOut, RegDestOut, Reg1Out, Reg2Out, Reg3Out}), 
			.write(~Stall));
   reg16 writeData(.readdata(WriteDataOut), .clk(Clk), .rst(Rst), .writedata(WriteDataIn), .write(~Stall));
      
endmodule // fetch2decode

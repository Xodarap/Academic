module execute2memory(input [15:0] AluOut, input [15:0] RegVal1, input [15:0] RegVal2,
		      input [2:0] Reg2Write2, input Clk, input Rst, input Stall,
		      output[15:0] nxtAluOut, output[15:0] nxtRV1, output[15:0] nxtRV2,
		      output[2:0] nxtReg2Write2);

   wire [12:0] 			   foo;
   
   reg16 r0(.readdata(nxtAluOut), .clk(Clk), .rst(Rst), .writedata(AluOut), .write(~Stall));
   reg16 r1(.readdata({foo, nxtReg2Write2}), .clk(Clk), .rst(Rst), .writedata({13'b0, Reg2Write2}), .write(~Stall));
   reg16 r2(.readdata(nxtRV1), .clk(Clk), .rst(Rst), .writedata(RegVal1), .write(~Stall));
   reg16 r3(.readdata(nxtRV2), .clk(Clk), .rst(Rst), .writedata(RegVal2), .write(~Stall));
endmodule // execute2memory

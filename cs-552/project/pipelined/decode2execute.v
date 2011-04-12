module decode2execute(input [15:0] RegVal1, input[15:0] RegVal2, input[2:0] Reg2Write2, input [15:0] pcplustwoin,
		      input Clk, input Rst, input Stall, input [2:0] Reg1Sel, input [2:0] Reg2Sel,
		      output[15:0] nextRV1, output[15:0] nextRV2, output[2:0] nxtReg2Write2,
		      output [2:0] nextReg1Sel, output [2:0] nextReg2Sel, output [15:0] pcplustwoout);

      wire [6:0] foo;
     reg16 pcplus(.readdata(pcplustwoout), .clk(Clk), .rst(Rst), .writedata(pcplustwoin), .write(~Stall));
     reg16 r0(.readdata(nextRV1), .clk(Clk), .rst(Rst), .writedata(RegVal1), .write(~Stall));
     reg16 r1(.readdata(nextRV2), .clk(Clk), .rst(Rst), .writedata(RegVal2), .write(~Stall));
     reg16 r2(.readdata({foo, nextReg1Sel, nextReg2Sel, nxtReg2Write2}), .clk(Clk), .rst(Rst), .writedata({7'b0, Reg1Sel, Reg2Sel, Reg2Write2}), .write(~Stall));
   
endmodule // decode2execute

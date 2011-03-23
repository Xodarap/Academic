/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;

   wire [15:0] 	 readDatas [0:7];
   wire [7:0] 	 writeEnable;
   
   reg [15:0] 	 readDataReg1, readDataReg2;

   /* The write enable for each reg is always zero unless the reg sel is
    exactly equal to its number and write is true */
   assign writeEnable[0] = write & (3'b000 == writeregsel);
   assign writeEnable[1] = write & (3'b001 == writeregsel);
   assign writeEnable[2] = write & (3'b010 == writeregsel);
   assign writeEnable[3] = write & (3'b011 == writeregsel);
   assign writeEnable[4] = write & (3'b100 == writeregsel);
   assign writeEnable[5] = write & (3'b101 == writeregsel);
   assign writeEnable[6] = write & (3'b110 == writeregsel);
   assign writeEnable[7] = write & (3'b111 == writeregsel);
   
   reg16 r0(.readdata(readDatas[0]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[0]));
   reg16 r1(.readdata(readDatas[1]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[1]));
   reg16 r2(.readdata(readDatas[2]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[2]));
   reg16 r3(.readdata(readDatas[3]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[3]));
   reg16 r4(.readdata(readDatas[4]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[4]));
   reg16 r5(.readdata(readDatas[5]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[5]));
   reg16 r6(.readdata(readDatas[6]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[6]));
   reg16 r7(.readdata(readDatas[7]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[7]));
   
   always @* case (read1regsel)
	       3'b000: readDataReg1 = readDatas[0];
	       3'b001: readDataReg1 = readDatas[1];
	       3'b010: readDataReg1 = readDatas[2];
	       3'b011: readDataReg1 = readDatas[3];
	       3'b100: readDataReg1 = readDatas[4];
	       3'b101: readDataReg1 = readDatas[5];
	       3'b110: readDataReg1 = readDatas[6];
	       3'b111: readDataReg1 = readDatas[7];
	     endcase // case (read1regsel)
   
   always @* case (read2regsel)
	       3'b000: readDataReg2 = readDatas[0];
	       3'b001: readDataReg2 = readDatas[1];
	       3'b010: readDataReg2 = readDatas[2];
	       3'b011: readDataReg2 = readDatas[3];
	       3'b100: readDataReg2 = readDatas[4];
	       3'b101: readDataReg2 = readDatas[5];
	       3'b110: readDataReg2 = readDatas[6];
	       3'b111: readDataReg2 = readDatas[7];
	     endcase // case (read2regsel)

   assign read1data = readDataReg1;
   assign read2data = readDataReg2;
endmodule
// DUMMY LINE FOR REV CONTROL :1:

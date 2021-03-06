module reg16(readdata, clk, rst, writedata, write);
   output [15:0] readdata;
   input 	clk, rst, write;
   input [15:0] writedata;
   
   onebitreg r0 (.readdata(readdata[0]), .clk(clk), .rst(rst), .writedata(writedata[0]), .write(write));
   onebitreg r1 (.readdata(readdata[1]), .clk(clk), .rst(rst), .writedata(writedata[1]), .write(write));
   onebitreg r2 (.readdata(readdata[2]), .clk(clk), .rst(rst), .writedata(writedata[2]), .write(write));
   onebitreg r3 (.readdata(readdata[3]), .clk(clk), .rst(rst), .writedata(writedata[3]), .write(write));
   onebitreg r4 (.readdata(readdata[4]), .clk(clk), .rst(rst), .writedata(writedata[4]), .write(write));
   onebitreg r5 (.readdata(readdata[5]), .clk(clk), .rst(rst), .writedata(writedata[5]), .write(write));
   onebitreg r6 (.readdata(readdata[6]), .clk(clk), .rst(rst), .writedata(writedata[6]), .write(write));
   onebitreg r7 (.readdata(readdata[7]), .clk(clk), .rst(rst), .writedata(writedata[7]), .write(write));
   onebitreg r8 (.readdata(readdata[8]), .clk(clk), .rst(rst), .writedata(writedata[8]), .write(write));
   onebitreg r9 (.readdata(readdata[9]), .clk(clk), .rst(rst), .writedata(writedata[9]), .write(write));
   onebitreg r10(.readdata(readdata[10]), .clk(clk), .rst(rst), .writedata(writedata[10]), .write(write));
   onebitreg r11(.readdata(readdata[11]), .clk(clk), .rst(rst), .writedata(writedata[11]), .write(write));
   onebitreg r12(.readdata(readdata[12]), .clk(clk), .rst(rst), .writedata(writedata[12]), .write(write));
   onebitreg r13(.readdata(readdata[13]), .clk(clk), .rst(rst), .writedata(writedata[13]), .write(write));
   onebitreg r14(.readdata(readdata[14]), .clk(clk), .rst(rst), .writedata(writedata[14]), .write(write));
   onebitreg r15(.readdata(readdata[15]), .clk(clk), .rst(rst), .writedata(writedata[15]), .write(write));
endmodule // reg16
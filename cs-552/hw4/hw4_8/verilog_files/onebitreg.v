module onebitreg(readdata, clk, rst, writedata, write);
   output readdata;
   input  clk, rst, writedata, write;
   wire   actualWrite;
   
   assign actualWrite = (write & writedata) | (~write & readdata);
   dff data(.q (readdata), .d(actualWrite), .clk (clk), .rst (rst));
endmodule // onebitreg

module rf_bypass (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
   input clk, rst, write;   
   input [2:0] read1regsel, read2regsel, writeregsel;
   input [15:0] writedata;
   wire [15:0] 	read1temp, read2temp;
   output [15:0] read1data, read2data;
   output        err;
   
   rf r1(.read1data (read1temp), .read2data(read2temp), .err(err), .clk(clk), .rst(rst), .read1regsel (read1regsel), .read2regsel(read2regsel), .writeregsel(writeregsel), .writedata(writedata), .write(write));

   // usually we just do whatever rf wants. In the event that readsel = writesel, then we change stuff
   assign read1data = (read1regsel == writeregsel) && write ? writedata : read1temp;
   assign read2data = (read2regsel == writeregsel) && write ? writedata : read2temp;
   
endmodule // rf_bypass

   
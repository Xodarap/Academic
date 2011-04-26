module memory(Clk, Rst, Addr, Data, MemWrite, MemRead, ReadData, Stall);
   input Clk, Rst;
   input [15:0] Addr, Data;
   input 	MemWrite, MemRead;
   output [15:0] ReadData;
   output 	 Stall;
   wire [15:0] 	 readTemp;
   wire 	 done, cacheHit;
   /*
   
   memory2c memory0(.data_out(readTemp), 
		    .data_in(Data), 
		    .addr(Addr), 
		    .enable(1'b1), 
		    .wr(MemWrite), 
		    .createdump(1'b0), 
		    .clk(Clk), 
		    .rst(Rst));*/
   stallmem memory0(/*AUTOINST*/
		    // Outputs
		    .DataOut		(readTemp),
		    .Done		(done),
		    .Stall		(Stall),
		    .CacheHit		(CacheHit),
		    .err		(err),
		    // Inputs
		    .DataIn		(DataIn[15:0]),
		    .Addr		(Addr[15:0]),
		    .Wr			(MemWrite),
		    .Rd			(MemRead),
		    .createdump		(1'b0),
		    .clk		(Clk),
		    .rst		(Rst));
   
   assign ReadData = readTemp & {16{MemRead}};
endmodule // memory

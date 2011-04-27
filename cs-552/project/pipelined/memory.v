module memory(Clk, Rst, Addr, Data, MemWrite, MemRead, ReadData, Stall);
   input Clk, Rst;
   input [15:0] Addr, Data;
   input 	MemWrite, MemRead;
   output [15:0] ReadData;
   output 	 Stall;
   wire [15:0] 	 readTemp;
   wire 	 done, cacheHit;
   
   stallmem memory0(/*AUTOINST*/
		    // Outputs
		    .DataOut		(readTemp),
		    .Done		(done),
		    .Stall		(Stall),
		    .CacheHit		(CacheHit),
		    .err		(err),
		    // Inputs
		    .DataIn		(Data),
		    .Addr		(Addr[15:0]),
		    .Wr			(MemWrite),
		    .Rd			(MemRead),
		    .createdump		(1'b0),
		    .clk		(Clk),
		    .rst		(Rst));
   
   assign ReadData = readTemp & {16{MemRead}};
endmodule // memory

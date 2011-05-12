module memory(Clk, Rst, Addr, Data, MemWrite, MemRead, ReadData, Stall, Err, CacheHit);
   input Clk, Rst;
   input [15:0] Addr, Data;
   input 	MemWrite, MemRead;
   output [15:0] ReadData;
   output 	 Stall, Err, CacheHit;
   
   wire [15:0] 	 readTemp;
   wire 	 Done, readOK, writeOK;
   wire 	 laststall, lastDone;
   wire 	 actuallyDoWrite, actuallyDoRead, memStall;
   
/* -----\/----- EXCLUDED -----\/-----
   stallmem memory0(/-*AUTOINST*-/
		    // Outputs
		    .DataOut		(readTemp),
		    .Done		(Done),
		    .Stall		(Stall),
		    .CacheHit		(CacheHit),
		    .err		(Err),
		    // Inputs
		    .DataIn		(Data),
		    .Addr		(Addr[15:0]),
		    .Wr			(MemWrite),
		    .Rd			(MemRead),
		    .createdump		(1'b0),
		    .clk		(Clk),
		    .rst		(Rst));
 -----/\----- EXCLUDED -----/\----- */

   assign actuallyDoRead = MemRead; //& ~lastDone;
   assign actuallyDoWrite = MemWrite; // & ~lastDone;
   //assign ReadData = readTemp & {16{MemRead}};

   assign ReadData = readTemp;
   
   assign readOK = MemRead & Done;
   assign writeOK = MemWrite & Done;

   assign Stall = memStall & (actuallyDoRead | actuallyDoWrite);
   

   onebitreg r0(/*AUTOINST*/
		// Outputs
		.readdata		(laststall),
		// Inputs
		.clk			(Clk),
		.rst			(Rst),
		.writedata		(Stall),
		.write			(1'b1));
   
   onebitreg r1(/*AUTOINST*/
		// Outputs
		.readdata		(lastDone),
		// Inputs
		.clk			(Clk),
		.rst			(Rst),
		.writedata		(Done),
		.write			(1'b1));


   
   mem_system_hier memory0(
			   // Outputs
			   .DataOut		(readTemp),
			   .Done		(Done),
			   .Stall		(memStall),
			   .CacheHit		(CacheHit),
			   // Inputs
			   .Addr		(Addr[15:0]),
			   .DataIn		(Data),
			   .Rd			(actuallyDoRead),
			   .Wr			(actuallyDoWrite),
			   .createdump		(1'b0));
   
endmodule // memory

module mem_system_hier_tb;
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			CacheHit;		// From mem0 of mem_system_hier.v
   wire [15:0]		DataOut;		// From mem0 of mem_system_hier.v
   wire			Done;			// From mem0 of mem_system_hier.v
   wire			Stall;			// From mem0 of mem_system_hier.v
   // End of automatics
   /*AUTOREG*/
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [15:0]		Addr;			// To mem0 of mem_system_hier.v
   reg [15:0]		DataIn;			// To mem0 of mem_system_hier.v
   wire			Rd;			// To mem0 of mem_system_hier.v
   wire			Wr;			// To mem0 of mem_system_hier.v
   reg			createdump;		// To mem0 of mem_system_hier.v
   // End of automatics
   reg [7:0] 		writes,reads,data;
   assign Rd = reads[0];
   assign Wr = writes[0];
   
   mem_system_hier mem0(/*AUTOINST*/
			// Outputs
			.DataOut	(DataOut[15:0]),
			.Done		(Done),
			.Stall		(Stall),
			.CacheHit	(CacheHit),
			// Inputs
			.Addr		(Addr[15:0]),
			.DataIn		(DataIn[15:0]),
			.Rd		(Rd),
			.Wr		(Wr),
			.createdump	(createdump));
   initial begin
      Addr = 16'h1112;
      DataIn = 16'h2222;
      writes = 7'b10100101;
      reads =  7'b01011010;
      $display("R W Data");
      
   end
   
   always@(posedge mem0.clk) begin
      if (~Stall) begin
	 $display("%d %b %b %x", mem0.clkgen.cycle_count, Rd, Wr, DataOut);
	 //$display("%b %b", reads, writes);
	 
	 writes = writes >> 1;
	 reads = reads >> 1;
	 DataIn = DataIn + 1;
	 
      end
      
      if((writes == 7'b0) && (reads == 7'b0)) begin
	 $finish;
      end
      
   end
endmodule // mem_system_hier_tb

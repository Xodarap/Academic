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
   reg			Rd;			// To mem0 of mem_system_hier.v
   reg			Wr;			// To mem0 of mem_system_hier.v
   reg			createdump;		// To mem0 of mem_system_hier.v
   // End of automatics
   
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
      Rd = 1'b0;
      Wr = 1'b1;
   end
   
   always@(posedge mem0.clk) begin
      if(mem0.clkgen.cycle_count == 10) begin
	 Rd = 1'b1;
	 Wr = 1'b0;
      end

      if(mem0.clkgen.cycle_count == 12) begin
	 Addr = 16'h1114;
	 Rd = 1'b0;
	 Wr = 1'b1;
	 DataIn = 16'h3333;
      end

      if(mem0.clkgen.cycle_count == 16) begin
	 Rd = 1'b1;
	 Wr = 1'b0;
      end
      
      if(mem0.clkgen.cycle_count == 18) begin
	 Addr = 16'hF114;
      end
      
      if(mem0.clkgen.cycle_count > 30) begin
	 $finish;
      end
   end
endmodule // mem_system_hier_tb

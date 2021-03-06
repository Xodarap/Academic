/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err,
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input [15:0] Addr;
   input [15:0] DataIn;
   input        Rd;
   input        Wr;
   input        createdump;
   input        clk;
   input        rst;
   
   output [15:0] DataOut;
   output Done;
   output Stall;
   output CacheHit;
   output err;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter mem_type = 0;
   
   // your code here
   
   // You must pass the mem_type parameter 
   // and createdump inputs to the 
   // cache modules

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [3:0]		busy;			// From mem0 of four_bank_mem.v
   wire			comp;			// From c0ctl of cache_controller.v
   wire [15:0]		data_out;		// From c0 of cache.v, ...
   wire			dirty;			// From c0 of cache.v
   wire			enable;			// From c0ctl of cache_controller.v
//   wire			hit;			// From c0 of cache.v
   wire [7:0]		index;			// From c0ctl of cache_controller.v
   //wire			stall;			// From mem0 of four_bank_mem.v
   wire [4:0]		tag;			// From c0ctl of cache_controller.v
   wire [4:0]		tag_out;		// From c0 of cache.v
   wire			valid;			// From c0 of cache.v, ...
   wire [1:0]		word;			// From c0ctl of cache_controller.v
   wire [1:0]		mem_word;		// From c0ctl of cache_controller.v
   wire			write;			// From c0ctl of cache_controller.v
   wire			writesrc;		// From c0ctl of cache_controller.v
   wire			offsetsel;
   // End of automatics

   wire 		memRd, memWr, cacheWr, memStall, cacheHitInternal;
   wire [2:0] 		offset;
   
   assign offset = Addr[2:0];
   assign index  = Addr[10:3];
   
   cache_two_way #(.cache_id(mem_type)) c0(/*AUTOINST*/
	    // Outputs
	    .tag_out_final		(tag_out[4:0]),
	    .data_out_final		(DataOut[15:0]),
	    .hit_final			(cacheHitInternal),
	    .dirty_final		(dirty),
	    .valid_final		(valid),
	    .err_final			(err),
	    // Inputs
	    .enable			(enable),
	    .clk			(clk),
	    .rst			(rst),
	    .createdump			(createdump),
	    .tag_in			(tag[4:0]),
	    .index			(index[7:0]),
	    .offset			({offsetsel ? mem_word[1:0] : word[1:0], 1'b0}),
	    .data_in			(writesrc ? DataIn[15:0] : data_out),
	    .comp			(comp),
	    .write			(cacheWr),
	    .valid_in			(1'b1)); // whenever we write, it's valid

   assign C2M = (~cacheHitInternal) & dirty & valid;
   assign M2C = (~cacheHitInternal & ~dirty) | (~valid);
   assign H   = cacheHitInternal & valid;
   //assign Stall = ~Done;
   //assign Stall = 0;
   
   
   cache_controller c0ctl(/*AUTOINST*/
			  // Outputs
			  .index		(index[7:0]),
			  .tag			(tag[4:0]),
			  .word			(word[1:0]),
			.mem_word		(mem_word[1:0]),
			  /*.valid		(valid),*/
			  .enable		(enable),
			  .comp			(comp),
			  .write		(write),
			  .writesrc		(writesrc),
			  .mem_rd               (memRd),
			  .mem_wr               (memWr),
			  .cache_wr             (cacheWr),
			  .done                 (Done),
			  .stall_out            (Stall),
			  .hit_out              (CacheHit),
			  .offsetsel		(offsetsel),
			  // Inputs
			  .clk			(clk),
			  .rst			(rst),
			  .rd			(Rd),
			  .wr			(Wr),
			  .M2C			(M2C),
			  .C2M			(C2M),
			  .H			(H),
			  .stall		(1'b0),
			  .addr			(Addr[15:0]));
   
   four_bank_mem mem0(/*AUTOINST*/
		      // Outputs
		      .data_out		(data_out[15:0]),
		      .stall		(memStall),
		      .busy		(busy[3:0]),
		      .err		(err),
		      // Inputs
		      .clk		(clk),
		      .rst		(rst),
		      .createdump	(createdump),
		      .addr		({offsetsel ? tag_out : tag, index, mem_word, 1'b0}),
		      .data_in		(DataOut[15:0]), // The only time we write to mem is if we're writing the contents of the cache
		      .wr		(memWr),
		      .rd		(memRd));
   
   
endmodule // mem_system

   


// DUMMY LINE FOR REV CONTROL :9:

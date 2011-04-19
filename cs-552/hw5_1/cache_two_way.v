module cache_two_way(             input enable,
				  input clk,
				  input rst,
	      input createdump,
              input [4:0] tag_in,
              input [7:0] index,
              input [2:0] offset,
              input [15:0] data_in,
              input comp,
              input write,
              input valid_in,

              output [4:0] tag_out_final,
              output [15:0] data_out_final,
              output hit_final,
              output dirty_final,
              output valid_final,
              output err_final);


   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [15:0]		data_out;		// From c0 of cache.v, ...
   wire			dirty;			// From c0 of cache.v, ...
   wire			err;			// From c0 of cache.v, ...
   wire			hit;			// From c0 of cache.v, ...
   wire [4:0]		tag_out;		// From c0 of cache.v, ...
   wire			valid;			// From c0 of cache.v, ...

   wire [15:0]		data_out2;		// From c0 of cache.v, ...
   wire			dirty2;			// From c0 of cache.v, ...
   wire			err2;			// From c0 of cache.v, ...
   wire			hit2;			// From c0 of cache.v, ...
   wire [4:0]		tag_out2;		// From c0 of cache.v, ...
   wire			valid2;			// From c0 of cache.v, ...
   // End of automatics

	parameter cache_id = 0;

   wire cachetowriteto;
   wire write1, write2, victim;

	cache #(.cache_id(0 + cache_id)) c0 (/*AUTOINST*/
					    // Outputs
					    .tag_out		(tag_out[4:0]),
					    .data_out		(data_out[15:0]),
					    .hit		(hit),
					    .dirty		(dirty),
					    .valid		(valid),
					    .err		(err),
					    // Inputs
					    .enable		(enable),
					    .clk		(clk),
					    .rst		(rst),
					    .createdump		(createdump),
					    .tag_in		(tag_in[4:0]),
					    .index		(index[7:0]),
					    .offset		(offset[2:0]),
					    .data_in		(data_in[15:0]),
					    .comp		(comp),
					    .write		(write1),
					    .valid_in		(valid_in));

   cache #(.cache_id(2 + cache_id)) c1(
				      // Outputs
				      .tag_out		(tag_out2[4:0]),
				      .data_out		(data_out2[15:0]),
				      .hit		(hit2),
				      .dirty		(dirty2),
				      .valid		(valid2),
				      .err		(err2),
				      // Inputs
				      .enable		(enable),
				      .clk		(clk),
				      .rst		(rst),
				      .createdump	(createdump),
				      .tag_in		(tag_in[4:0]),
				      .index		(index[7:0]),
				      .offset		(offset[2:0]),
				      .data_in		(data_in[15:0]),
				      .comp		(comp),
				      .write		(write2),
				      .valid_in		(valid_in));
   
	assign hit_final = (hit | hit2);
   assign valid_final =    hit ? valid : hit2 ? valid2 : cachetowriteto ? valid2 : valid;
   assign dirty_final =  hit ? dirty : hit2 ? dirty2 : cachetowriteto ? dirty2 : dirty;
   assign tag_out_final =  hit ? tag_out : hit2 ? tag_out2 : cachetowriteto ? tag_out2 : tag_out;
   assign data_out_final = hit ? data_out : hit2 ? data_out2 : cachetowriteto ? data_out2 : data_out;

	assign err = err | err2;

	assign cachetowriteto = (valid & ~valid2) ? 1'b1 : (~valid & valid2) ? 1'b0 : (~valid & ~valid2) ? 1'b0 : victim;
	assign write1 = ((~cachetowriteto & write & ~comp) | (write & comp));
	assign write2 = ((cachetowriteto & write & ~comp) | (write & comp));

   onebitreg victimizer(.readdata(victim), .clk(clk), .rst(rst), .writedata(~victim), .write(hit));	

endmodule

module mem_interface (
    input         clk,
    input         rst,
    input         createdump,
    input  [15:0] addr,
    input  [15:0] data_in,
    input         wr,
    input         rd,               
    output [15:0] data_out,
    output reg    stall,
    output        err
);

   wire [3:0] 	  foo;
   wire 	  mem_stall;
   wire [2:0] 	  current_state;
   wire [12:0] 	  temp;
   reg [2:0] 	  next_state;

   /*AUTOREG*/
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [3:0]		busy;			// From mem0 of four_bank_mem.v
   // End of automatics
   four_bank_mem mem0(/*AUTOINST*/
		      // Outputs
		      .data_out		(data_out[15:0]),
		      .stall		(stall),
		      .busy		(busy[3:0]),
		      .err		(err),
		      // Inputs
		      .clk		(clk),
		      .rst		(rst),
		      .createdump	(createdump),
		      .addr		(addr[15:0]),
		      .data_in		(data_in[15:0]),
		      .wr		(wr),
		      .rd		(rd));
   
/*   
   four_bank_mem mem0(.clk(clk),
			 .rst(rst),
			 .createdump(createdump),
			 .addr(addr),
			 .data_in(data_in),
			 .wr(wr & (current_state == 3'b0)),
			 .rd(rd & (current_state == 3'b0)),               
			 .data_out(data_out),
			 .stall(mem_stall),
			 .busy(foo),
			 .err(err));
*/
   reg16 state(.readdata({temp, current_state}), .clk(clk), 
		 .rst(rst), .writedata({13'b0, next_state}), .write(1'b1));
   
   always @(*) begin
      casex ({mem_stall, rd, wr, current_state})
	// If memory is stalling (i.e. current request is ignored) then
	// stay in current state
	6'b1xxxxx: begin
	   stall = 1'b1;
//(current_state == 3'b0) ? 1'b0 : 1'b1;
	  next_state = current_state;
	end

	// Doing nothing, and we wanna keep doing nothing
	6'b0: begin
	   stall = 1'b0;
	   next_state = 3'b0;
	end
	
	// Reading -> Go to read
	6'b010000: begin
	   stall = 1'b0;
	   next_state = 3'b001;
	end
	// Writing
	6'b001000: begin
	   stall = 1'b0;
	   next_state = 3'b010;
	end

	/* We're in the middle of something */
	// Second cycle of read
	6'bxxx001: begin
	   stall = 1'b1;
	   next_state = 3'b0;
	end
	// 3rd cycle of read
	6'bxxx101: begin
	   stall = 1'b1;
	   next_state = 3'b0;
	end
	
	// Second cycle of write
	6'bxxx010: begin
	   stall = 1'b1;
	   next_state = 3'b011;
	end
	// 3rd cycle of write
	6'bxxx011: begin
	   stall = 1'b1;
	   next_state = 3'b100;
	end
	// 4th cycle of write
	6'bxxx100: begin
	   stall = 1'b1;
	   next_state = 3'b0;
	end
	default: $display("Unhandled case: %b", {mem_stall, rd, wr, current_state});
      endcase // case (current_counter)
   end
endmodule // mem_interface

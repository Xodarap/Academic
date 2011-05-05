module cache_controller(clk, rst, rd, wr, stall, M2C, C2M, H, addr,
			/*mem_addr, mem_datain,*/ mem_wr, mem_rd, offsetsel,
			index, tag, word, mem_word, /*valid, */
			enable, comp, write, writesrc, done, cache_wr, stall_out, hit_out);
   input clk, rst, rd, wr /*, mem_wr, mem_rd*/;
   input M2C, C2M, H; //inputs from the cache
   input stall;
   input [15:0] addr;
   /*input [15:0] mem_addr, mem_datain;*/
   
   output [7:0] index;
   output [4:0] tag;
   output reg offsetsel;
   output reg [1:0] word;
   output reg [1:0] mem_word;
   output reg 	    /*valid, enable,*/ comp, write, mem_wr, mem_rd, done, cache_wr, stall_out, hit_out;
   output reg 	    writesrc; //1:data in - 0:memory
   output 	    enable;
  /* input 	    valid;*/
   
   reg 		    error;	//1: an error has occured

   localparam	RESET = 4'd0, COMPREAD = 4'd1, COMPWRITE = 4'd2, 
     CACHE2MEM0 = 4'd3, CACHE2MEM1 = 4'd4, CACHE2MEM2 = 4'd5, CACHE2MEM3 = 4'd6, CACHE2MEM4 = 4'd7,
     MEM2CACHE0 = 4'd8, MEM2CACHE1 = 4'd9, MEM2CACHE2 = 4'd10, MEM2CACHE3 = 4'd11, 
     MEM2CACHE4 = 4'd12, MEM2CACHE5 = 4'd13, DONE = 4'd14;
   
   wire [3:0] 	    state;
   reg [3:0] 	    nextstate;
   wire [11:0]		garbage;
   assign enable = 1'b1;
   
   //state register
   reg16 statereg (.readdata({garbage,state}), .clk(clk), .rst(rst), .writedata({12'b0,nextstate}), .write(1'b1));
   
   assign tag = addr[15:11];
   assign index = addr[10:3];

   
   
   always@(*) begin
      case(state)
	RESET: begin
	   offsetsel = 1'b0;
	   word = 2'b0;
	   mem_word = 2'b0;
	   comp = 1'b1;
	   //write = 1'b0;
	   writesrc = 1'b0;
	   error = 1'b0;
	   nextstate = (rd & ~wr) ? COMPREAD : (wr & ~rd) ? COMPWRITE : RESET;
	   mem_wr = 1'b0;
	   mem_rd = 1'b0;
	   done = 1'b0;
	   cache_wr = 1'b0;
	   stall_out = 1'b1;
	   hit_out = 1'b1;
	   
	end
	COMPREAD: begin
	   comp = 1'b1;
	   //write = 1'b0;
	   word = addr[2:1];
	   nextstate = H ? DONE : (M2C ? MEM2CACHE0 : CACHE2MEM0);
	   mem_wr = 1'b0;
	   mem_rd = 1'b0;
	   cache_wr = 1'b0;
	 //  done = H;
	   stall_out = 1'b1;
	   offsetsel = 1'b0;
	end
	COMPWRITE: begin
	   comp = 1'b1;
	   //write = 1'b1;
	   word = addr[2:1];
	   writesrc = 1'b1;
	   nextstate = H ? DONE : (C2M ? CACHE2MEM0 : MEM2CACHE0);
	   mem_wr = 1'b0;
	   mem_rd = 1'b0;
	 //  done = H;		       
	  /* done = 1'b0;*/
	   cache_wr = 1'b1;
		stall_out = 1'b1;
	   offsetsel = 1'b0;
	end
	
	//////////////
	//CACHE TO MEM
	//////////////
	CACHE2MEM0: begin
	   //cache controls
	   offsetsel = 1'b1;
	   word = 2'd0;
	   comp = 1'b0;
	   cache_wr = 1'b0;
	   //write = 1'b0;
	   //mem controls
	   //mem_wr = 1'b1;
	   //mem_rd = 1'b0;
	   //state logic
	   nextstate = stall ? CACHE2MEM0 : CACHE2MEM1;
	end
	CACHE2MEM1: begin
	   word = 2'd1;
	   comp = 1'b0;
	   cache_wr = 1'b0;
	   //write = 1'b0;
	   mem_word = 2'd0;
	   mem_wr = 1'b1;
	   mem_rd = 1'b0;
	   nextstate = stall ? CACHE2MEM1 : CACHE2MEM2;
	end
	CACHE2MEM2: begin
	   word = 2'd2;
	   comp = 1'b0;
	   cache_wr = 1'b0;
	   //write = 1'b0;
	   mem_word = 2'd1;
	   mem_wr = 1'b1;
	   mem_rd = 1'b0;
	   nextstate = stall ? CACHE2MEM2 : CACHE2MEM3;
	end
	CACHE2MEM3: begin
	   word = 2'd3;
	   comp = 1'b0;
	   cache_wr = 1'b0;
	   //write = 1'b0;
	   mem_word = 2'd2;
	   mem_wr = 1'b1;
	   mem_rd = 1'b0;
	   nextstate = stall ? CACHE2MEM3 : CACHE2MEM4;
	end
	CACHE2MEM4: begin
	   comp = 1'b0;
	   //write = 1'b0;
	   cache_wr = 1'b0;
	   mem_word = 2'd3;
	   mem_wr = 1'b1;
	   mem_rd = 1'b0;
	   nextstate = stall ? CACHE2MEM4 : MEM2CACHE0;
	end
	
	//////////////
	//MEM TO CACHE
	//////////////
	MEM2CACHE0: begin
	   offsetsel = 1'b0;
	   hit_out = 1'b0;
	   //word = 2'd0;
	   comp = 1'b0;
	   cache_wr = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_word = 2'd0;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   nextstate = stall ? MEM2CACHE0 : MEM2CACHE1;
	end
	MEM2CACHE1: begin
	   //word = 2'd1;
	   comp = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_word = 2'd1;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   cache_wr = 1'b0;
	   nextstate = stall ? MEM2CACHE1 : MEM2CACHE2;
	end
	MEM2CACHE2: begin
	   word = 2'd0;
	   comp = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_word = 2'd2;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   cache_wr = 1'b1;
	   nextstate = stall ? MEM2CACHE2 : MEM2CACHE3;
	end
	MEM2CACHE3: begin
	   word = 2'd1;
	   comp = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_word = 2'd3;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   cache_wr = 1'b1;
	   nextstate = stall ? MEM2CACHE3 : MEM2CACHE4;
	end
	MEM2CACHE4: begin
	   word = 2'd2;
	   comp = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   cache_wr = 1'b1;
	   nextstate = stall ? MEM2CACHE4 : MEM2CACHE5;
	end
	MEM2CACHE5: begin
	   word = 2'd3;
	   comp = 1'b0;
	   //write = 1'b1;
	   writesrc = 1'b0;
	   mem_wr = 1'b0;
	   mem_rd = 1'b1;
	   cache_wr = 1'b1;
	   nextstate = stall ? MEM2CACHE5 : wr ? COMPWRITE : COMPREAD;
	end	
	DONE: begin

	   offsetsel = 1'b0;
//	   word = 2'b1;
//	   mem_word = 2'b0;
	   comp = 1'b1;
	   writesrc = 1'b0;
	   error = 1'b0;
	   nextstate = RESET;
	   mem_wr = 1'b0;
	   mem_rd = 1'b0;
	   done = 1'b1;
	   cache_wr = 1'b0;
	   stall_out = 1'b0;


	end
	default: begin
	   error = 1'b1;
	end
      endcase
   end

endmodule

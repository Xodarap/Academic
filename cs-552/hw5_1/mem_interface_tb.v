module mem_interface_tb;
   wire Clk, Rst, Err, readdata, createdump,stall;
   wire [15:0] addr, data_in, data_out;
   reg 	write, writedata, wr, rd;
   integer cycle_count;
   
   assign createdump = 0;
   assign data_in = 16'hABCD;
   assign       addr = 16'b0;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   mem_interface mem0(
		      .clk	 (Clk),	 
		      .rst	 (Rst),	 
		      .createdump (createdump), 
		      .addr	 (addr),	 
		      .data_in	 (data_in),	 
		      .wr	 (wr),	 
		      .rd         (rd),               
		      .data_out	 (data_out),	 
		      .stall	 (stall),	 
		      .err         (Err)         
		      );

   initial begin
      cycle_count = 0;
      #10 wr = 1'b1;
      #10 rd = 1'b0;
   end
   
   
   always @(posedge Clk) begin
      #1 $display("cycle: %d stall: %b rd: %x st: %x", cycle_count, stall, data_out, mem0.current_state);
      cycle_count = cycle_count + 1;
      
      if (cycle_count == 4) begin
	 #10 wr = 1'b0;
	 #10 rd = 1'b1;
      end
      
      if (clk.cycle_count > 20) begin
	 $finish;
      end
   end
endmodule // mem_interface_tb

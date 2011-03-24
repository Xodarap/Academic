module tb_onebitreg;
   wire Clk, Rst, Err, readdata;
   reg 	write, writedata;
   
   
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   onebitreg myreg(.readdata (readdata), .clk (Clk), .rst (Rst), .writedata(writedata), .write(write));

   initial begin
      write = 1;
      writedata = 1;
      #300 write = 0;
      writedata = 0;
      #100 write = 1;
      #100 write = 0;
      
   end
   
   always @(posedge Clk) begin
      $display("%b", readdata);

      
      if (clk.cycle_count > 10) begin
	 $finish;
      end
   end
   

endmodule // onebitreg

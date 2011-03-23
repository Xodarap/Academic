module tb_onebitreg;
   wire Clk, Rst, Err, readdata;
   reg 	write, writedata;
   
   
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   onebitreg myreg(.readdata (readdata), .clk (Clk), .rst (Rst), .writedata(writedata), .write(write));

   initial begin
      write = 1;
      writedata = 1;
    end
   
   always @(posedge Clk) begin
      $display("%b", readdata);

      writedata = (clk.cycle_count % 3 == 0) ? !writedata : writedata;
      if(clk.cycle_count % 3 == 0) begin
	 $display("Changing value to: %d", writedata);
      end
      
      
      if (clk.cycle_count > 10) begin
	 $finish;
      end
   end
   

endmodule // onebitreg

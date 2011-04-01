module tb_rf;
   wire Clk, Rst, Err, readdata;
   reg 	write;
   wire [15:0] read1data, read2data;
   reg [2:0]   read1regsel, read2regsel, writeregsel;
   reg [15:0]  writedata;
   
   
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));

 rf myreg (
                .read1data (read1data), .read2data (read2data), .err (Err),
                .clk(Clk), .rst (Rst), .read1regsel(read1regsel), .read2regsel(read2regsel), 
	   .writeregsel(writeregsel), .writedata(writedata), .write(write)
     );
   
   initial begin
      read1regsel = 0;
      read2regsel = 1;
      writeregsel = 0;
      write = 1;
      writedata = 1;
      #300 writeregsel = 1;
      writedata = 32;
      #100 write = 0;
      
   end
   
   always @(posedge Clk) begin
      $display("1: %d, 2:%d", read1data, read2data);

      
      if (clk.cycle_count > 10) begin
	 $finish;
      end
   end
   

endmodule // onebitreg

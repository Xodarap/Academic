module tb_rf_hier;
   reg 	write;
   wire [15:0] read1data, read2data;
   reg [2:0]   read1regsel, read2regsel, writeregsel;
   reg [15:0]  writedata;
   reg [7:0]   cnt;
   
   
   

 rf_hier myreg (
                .read1data (read1data),    .read2data (read2data),
                .read1regsel(read1regsel), .read2regsel(read2regsel), 
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
      cnt = 1;
      
   end
   
   always @(posedge myreg.clk) begin
      $display("1: %d, 2:%d", read1data, read2data);
      cnt = cnt + 1;
      
      
      if (cnt > 10) begin
	 $finish;
      end
  end
   

endmodule // onebitreg

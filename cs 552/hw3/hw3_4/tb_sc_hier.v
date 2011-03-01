module tb_sc_hier;
   wire [2:0] out [0:2];
   reg [2:0]	      rst;
   reg [7:0]  cnt;
   
   
   sc_hier s1(.out(out[0]), .ctr_rst(rst[0]));
   sc_hier s2(.out(out[1]), .ctr_rst(rst[1]));   
   sc_hier s3(.out(out[2]), .ctr_rst(rst[2]));
   
   initial begin
      rst = 0;
      cnt = 0;
   end
   
   always @(posedge s1.clk) begin
      cnt = cnt + 1;
      $display("%d(%b) %d(%b) %d(%b)", out[0], rst[0],
	       out[1], rst[1],
	       out[2], rst[2]);

      if (cnt == 6) begin
	  rst[1] = 1;
      end

      if(cnt == 7) begin
	 rst = 1;
      end

      if(cnt == 8) begin
	 rst = 0;
	 end
      
      if (cnt > 15) begin
	 $finish;
      end
   end
   

endmodule // onebitreg

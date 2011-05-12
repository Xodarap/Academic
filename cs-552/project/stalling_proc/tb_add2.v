module tb_add2();
   reg [15:0] Pc;
   wire [15:0] PcPrime;
   wire        Clk, Rst, Err;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   add2 a2(.Pc(Pc), .PcPrime(PcPrime));
   initial begin
      Pc = 0;
   end
   
   always@(posedge Clk) begin
      $display("%d == %d (%d)", PcPrime, Pc+2, (PcPrime == Pc + 2));
      Pc = $random;

      if(clk.cycle_count > 10) begin
	 $finish;
      end
      
	 
   end
endmodule
   
   
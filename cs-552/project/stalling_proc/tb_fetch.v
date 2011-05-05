module tb_fetch();
   wire  [15:0] Pc, Instruction;
   
   reg   [15:0] PcPrime;
   reg 		PcSrc;
   wire        Clk, Rst, Err;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   fetch fetch0(.Clk(Clk), .Rst(Rst), .PcSrc(PcSrc), .NewPc(PcPrime), .Instruction(Instruction));
   initial begin
      PcPrime = 0;
      PcSrc = 1;
      
   end
   
   always@(posedge Clk) begin
      $display("PC: %h, PC Src: %b, PcPrime: %h", fetch0.pc, PcSrc, PcPrime);
      PcPrime = $random;

      PcSrc = ((clk.cycle_count % 3) == 0) ? ~PcSrc : PcSrc;
      
      if(clk.cycle_count > 10) begin
	 $finish;
      end
   end
endmodule
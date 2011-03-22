module tb_cond_set();
   reg [15:0] In;
   reg 	      Ofl, Z, Sign;
   reg [2:0]   Control;
   wire [15:0] Out;
   wire        Clk, Rst, Err;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   cond_set cset(.In(In), .Control(Control), .Zero(Z), .Ofl(Ofl), .Sign(Sign), .Out(Out));
   
   initial begin
      In = 16'hABCD;
      Ofl = 0;
      Z = 0;
      Sign = 0;
      #100 Control = 0;
   end

   always @(posedge Clk) begin
      $display("Clk: %d, Op: %b, Z: %b, Ofl: %b, Sign: %b, Out: %h", clk.cycle_count, Control, Z, Ofl, Sign, Out);

      if(clk.cycle_count == 2) begin
	 Control = 3'b100;
      end

      #10 Control = (clk.cycle_count % 8 == 0) ? Control + 1 : Control;
      #10 Z = (clk.cycle_count % 2 == 0) ? ~Z : Z;
      #10 Ofl = (clk.cycle_count % 4 == 0) ? ~Ofl : Ofl;
      #10 Sign = (clk.cycle_count % 8 == 0) ? ~Sign : Sign;
            
      if (clk.cycle_count > 28) begin
	 $finish;
      end
   end
endmodule   

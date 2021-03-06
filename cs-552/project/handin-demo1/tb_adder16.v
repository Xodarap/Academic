module tb_adder16;
   reg [15:0] A, B;
   reg 	      Cin, Err;
   wire [15:0] S;
   wire        Cout;
   wire        Clk, Rst;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   adder16 a(.A (A), .B(B), .Cin (Cin), .S (S), .Cout(Cout));
   
   
   initial begin
      A = 123456;
      B = 432413;
      Cin = 0;
      Err = 0;
      
   end

   always @(posedge Clk) begin
      $display("%d + %d + %d = (%d) + %d [%d]", A, B, Cin, Cout, S, A + B + Cin);
      
      Cin = ~Cin;
      A = A + 34137;
      B = B + 89324;
      
      if (clk.cycle_count > 10) begin
	 $finish;

      end
   end
   

endmodule // tb_adder16

module tb_adder16;
   reg [15:0] A, B;
<<<<<<< HEAD
   wire [15:0] S;
   reg 	      Cin;
   wire       Cout;
   
   reg 	      clk;
   
   
   adder16 a1(.A (A), .B (B), .Cin(Cin), .S(S), .Cout(Cout));
   
   initial begin
      A = 10;
      B = 42;
      clk = 0;
      clk = 1;
      
   end

   always @(posedge clk) begin
      $display("%d + %d = %d", A, B, S);
      clk = 0;
      
=======
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
>>>>>>> 4522979e66c4c4928486f4586e006d20a0267740
   end
   

endmodule // tb_adder16

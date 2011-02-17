module tb_adder16;
   reg [15:0] A, B;
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
      
   end
   

endmodule // tb_adder16

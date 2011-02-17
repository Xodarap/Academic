module tb_alu_shift;
   reg [15:0] A, B;
   reg 	      Cin, Err, invA, invB, sign;
   reg [2:0]   Op;
   
   wire [15:0] Out;
   wire        Ofl, Z;
   wire        Clk, Rst;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   alu a1(.A(A), .B(B), .Cin(Cin), .Op(Op), .invA(invA), .invB(invB), .sign(sign), .Out(Out), .Ofl(Ofl), .Z(Z));
   //shifter s1(.In(A), .Cnt(B[3:0]), .Op(Op[1:0]), .Out(Out));
   
   
   
   initial begin
      A = 1;
      B = 2;
      Cin = 0;
      Err = 0;
      Op = 0;
      invA = 0;
      invB = 0;
      sign = 0;
      
   end

   always @(posedge Clk) begin
      $display("%d << %d = %d [%d]", A, B, Out, A << B);
      
      Cin = ~Cin;
      A = A + 341;
     // B = B + 89324;
      
      if (clk.cycle_count > 10) begin
	 $finish;

      end
   end
   

endmodule

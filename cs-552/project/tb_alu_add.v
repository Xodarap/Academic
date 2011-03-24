module tb_alu_add;
   reg [15:0] A, B;
   reg 	      Cin, Err, invA, invB, sign;
   reg [2:0]   Op;
   reg 	       shouldOfl;
   reg [15:0]  Sum;
   reg [16:0]  BigSum;
   
   wire [15:0] Out;
   wire        Ofl, Z;
   wire        Clk, Rst;
   
   clkrst clk(.clk (Clk), .rst (Rst), .err(Err));
   alu a1(.A(A), .B(B), .Cin(Cin), .Op(Op), .invA(invA), .invB(invB), .sign(sign), .Out(Out), .Ofl(Ofl), .Z(Z));
      
   
   initial begin
      // A + B is an overflow in signed, but not unsigned
      A = 16'b0111111111111111;
      B = 1;
      Cin = 0;
      Err = 0;
      Op = 3'b100;
      invA = 0;
      invB = 0;
      sign = 0;
   end

   // Fuzz testing. Just adds random numbers with random signs etc
   // and checks that everything's ok
   always @(posedge Clk) begin
      // Big sum is 17 bits so it catches the overflow
      BigSum = A + B;
      shouldOfl = sign ? (A[15] == B[15]) && (BigSum[15]) : BigSum > 16'b1111111111111111;
      if(~(invA | invB) && (Ofl != shouldOfl)) begin
	 $display("Ofl: %b + %b overflow: %b; sum: %b", A, B, Ofl, Out);
      end
      if(Z != (Out == 0)) begin
	 $display("Zero: %d + %d zero: %d", A, B, Z);	 
      end
      Sum = invA ? (invB ? ~A + ~B : ~A + B) : (invB ? A + ~B : A + B);
      if(Out != Sum) begin
	 $display("Sum: %d + %d = %d instead of %d", A, B, Out, Sum);
      end
      
      sign = ~sign;
      
      if(clk.cycle_count == 3) begin
	 A = 0;
	 B = 0;
      end
      if(clk.cycle_count > 4) begin
	 if(($random % 2) == 1) begin
	    invA = ~invA;
	 end
      end
      if(clk.cycle_count > 5) begin
	 if(($random % 2) == 1) begin
	    invB = ~invB;
	 end
      end
      if(clk.cycle_count > 6) begin
	 A = A + $random;
	 B = B + $random;
      end
      
      if (clk.cycle_count > 100) begin
	 $finish;
      end
   end
endmodule

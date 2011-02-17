module tb_alu_add;
   reg [15:0] A, B;
   reg 	      Cin, Err, invA, invB, sign;
   reg [2:0]   Op;
   
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

   always @(posedge Clk) begin
      $display("%d + %d overflow with sign = %d: %d", A, B, sign, Ofl);
      $display("%d + %d = 0? %d", A, B, Z);
  
      sign = ~ sign;
      
      if(clk.cycle_count > 3) begin
	 A = 0;
	 B= 0;
      end
      
      
      if (clk.cycle_count > 4) begin
	 $finish;

      end
   end
   

endmodule

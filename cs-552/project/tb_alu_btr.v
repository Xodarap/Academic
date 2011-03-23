module tb_alu_btr();
   reg [15:0] A;
   reg [3:0]  Op;
   wire [15:0] Out;
   wire        ofl, z, res, Clk, Rst, Err;
   
   
   alu a0(.A(A), .B(16'd5), .Cin(1'b0), .Op(4'b1000), .invA(1'b0), .invB(1'b0), 
	  .sign(1'b1), .Out(Out), .Ofl(ofl), .Z(z), .resultSign(res));

   clkrst c0(.clk(Clk), .rst(Rst), .err(Err));
   
   
   initial begin
      A = 0;
   end
   
   always @(posedge Clk) begin
      $display("%b -> %b", A, Out);
      
      A = $random;

      if(c0.cycle_count > 10) begin
	 $finish;
      end
   end
   
endmodule // tb_alu_subi

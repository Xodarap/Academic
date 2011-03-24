module tb_alu_subi();
   reg [15:0] A;
   reg [3:0]  Op;
   wire [15:0] Out;
   wire        ofl, z, res, Clk, Rst, Err;
   
   
   alu a0(.A(A), .B(16'd5), .Cin(1'b0), .Op(4'b0101), .invA(1'b0), .invB(1'b0), 
	  .sign(1'b1), .Out(Out), .Ofl(ofl), .Z(z), .resultSign(res));

   clkrst c0(.clk(Clk), .rst(Rst), .err(Err));
   
   
   initial begin
      A = 0;
   end
   
   always @(posedge Clk) begin
      if (Out != (A - 5)) begin
	 $display("ERROR: %d != %d", Out, A-5);
      end

      if(((A-5) == 0) && ~z) begin
	 $display("Zero was incorrect");
      end
      
      
      A = $random;

      if(c0.cycle_count > 1000) begin
	 $finish;
      end
   end
   
endmodule // tb_alu_subi

module control_ff2(input [35:0] control_in,
		  input [15:0] Inst_in,
		  input clk,
		  input rst,
		  input Stall,
		  input Halt_in,
		  output [35:0] control_out,
		  output [15:0] Inst_out,
		  output Halt_out);
   wire [10:0] 			foo;
   
   
   reg16 r0(.readdata(control_out[15:0]), .clk(clk), .rst(rst), .writedata(control_in[15:0]), .write(~Stall));
   reg16 r1(.readdata(control_out[31:16]), .clk(clk), .rst(rst), .writedata(control_in[31:16]), .write(~Stall));
   reg16 r2(.readdata({foo, Halt_out, control_out[35:32]}), .clk(clk), .rst(rst), .writedata({11'b0, Halt_in, control_in[35:32]}), .write(~Stall));
   reg16 r3(.readdata(Inst_out[15:0]), .clk(clk), .rst(rst), .writedata(Inst_in[15:0]), .write(~Stall));   
endmodule // control_ff

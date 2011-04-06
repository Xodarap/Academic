module control_ff(input [35:0] control_in,
		  input clk,
		  input rst,
		  output [35:0] control_out);
   wire [11:0] 			foo;
   
   
   reg16 r0(.readdata(control_out[15:0]), .clk(clk), .rst(rst), .writedata(control_in[15:0]), .write(1'b1));
   reg16 r1(.readdata(control_out[31:16]), .clk(clk), .rst(rst), .writedata(control_in[31:16]), .write(1'b1));
   reg16 r2(.readdata({foo, control_out[35:32]}), .clk(clk), .rst(rst), .writedata({12'b0, control_in[35:32]}), .write(1'b1));   
endmodule // control_ff

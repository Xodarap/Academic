/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module fifo(/*AUTOARG*/
   // Outputs
   data_out, fifo_empty, fifo_full, data_out_valid, err, 
   // Inputs
   data_in, data_in_valid, pop_fifo, clk, rst
   );
   input [63:0] data_in;
   input        data_in_valid;
   input        pop_fifo;
   
   input        clk;
   input        rst;
   output [63:0] data_out;
   output        fifo_empty;
   output        fifo_full;
   output        data_out_valid;
   output        err;
   
   wire [63:0] fifo0;
   wire [63:0] fifo1;
   wire [63:0] fifo2;
   wire [63:0] fifo3;
   reg [63:0] fifo_next0;
   reg [63:0] fifo_next1;
   reg [63:0] fifo_next2;
   reg [63:0] fifo_next3;
   reg [63:0] outputdata;
   wire read_cmd, write_cmd;
   wire [1:0] readstate, readstate_next;  //0, 1, 2, or 3
   wire [1:0] writestate, writestate_next;  //0, 1, 2, or 3
   wire [3:0] rwcounter; //0(empty), 1, 2, 3, or 4(full)
   wire [1:0] readstate_plus1, writestate_plus1; //because we cant use (readstate + 1)
     
   dff reg1[63:0](.q(fifo0), .d(fifo_next0), .clk(clk), .rst(rst));
   dff reg2[63:0](.q(fifo1), .d(fifo_next1), .clk(clk), .rst(rst));
   dff reg3[63:0](.q(fifo2), .d(fifo_next2), .clk(clk), .rst(rst));
   dff reg4[63:0](.q(fifo3), .d(fifo_next3), .clk(clk), .rst(rst)); 
   
   fulladder2 addr(.A(readstate[1:0]), .B(2'b1), .SUM(readstate_plus1));
   fulladder2 addw(.A(writestate[1:0]), .B(2'b1), .SUM(writestate_plus1));
   
   counter5 countrw(.push(write_cmd), .pop(read_cmd), .rst(rst), .clk(clk), .currentState(rwcounter));
   
   always @* begin
    casex ({write_cmd, writestate})
     3'b0xx: begin
      fifo_next0 = fifo0;
      fifo_next1 = fifo1;
      fifo_next2 = fifo2;
      fifo_next3 = fifo3;
      end
     3'b100: begin
      fifo_next0 = data_in;
      fifo_next1 = fifo1;
      fifo_next2 = fifo2;
      fifo_next3 = fifo3;
      end
     3'b101: begin
      fifo_next0 = fifo0;
      fifo_next1 = data_in;
      fifo_next2 = fifo2;
      fifo_next3 = fifo3; 
      end
     3'b110: begin
      fifo_next0 = fifo0;
      fifo_next1 = fifo1;
      fifo_next2 = data_in;
      fifo_next3 = fifo3;
      end
     3'b111:begin
      fifo_next0 = fifo0;
      fifo_next1 = fifo1;
      fifo_next2 = fifo2;
      fifo_next3 = data_in; 
      end
    endcase 
   end
   
   
   always @* begin
   	case(readstate)
   		2'b00: outputdata = fifo0;
   		2'b01: outputdata = fifo1;
   		2'b10: outputdata = fifo2;
   		2'b11: outputdata = fifo3;
   	endcase
   end
   
   assign data_out = outputdata;
   
   assign data_out_valid = read_cmd;
   
   assign fifo_empty = (rwcounter == 3'b000);
   assign fifo_full = (rwcounter == 3'b100);
  
   assign read_cmd = pop_fifo & (~fifo_empty) | (fifo_full & pop_fifo & data_in_valid);
   assign write_cmd = data_in_valid & (~fifo_full) | (fifo_empty & pop_fifo & data_in_valid);
              
   dff rs1[1:0](.q(readstate), .d(readstate_next), .clk(clk), .rst(rst));
   dff ws1[1:0](.q(writestate), .d(writestate_next), .clk(clk), .rst(rst));
   
   assign readstate_next = ({2{read_cmd}} & readstate_plus1) | ({2{~read_cmd}} & readstate);
   assign writestate_next = (write_cmd)? (writestate_plus1) : writestate;
      
endmodule
// DUMMY LINE FOR REV CONTROL :1:

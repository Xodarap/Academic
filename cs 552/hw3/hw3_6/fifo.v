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
   
   wire [63:0] fifo[3:0];
   wire [63:0] fifo_next[3:0];
   wire read_cmd, write_cmd;
   wire [1:0] readstate, readstate_next;  //0, 1, 2, or 3
   wire [1:0] writestate, writestate_next;  //0, 1, 2, or 3
   wire [3:0] rwcounter, rwcounter_next;  //0(empty), 1, 2, or 3(full)
   
   dff reg1[63:0](.q(fifo[0]), .d(fifo_next[0]), .clk(clk), .rst(rst));
   dff reg2[63:0](.q(fifo[1]), .d(fifo_next[1]), .clk(clk), .rst(rst));
   dff reg3[63:0](.q(fifo[2]), .d(fifo_next[2]), .clk(clk), .rst(rst));
   dff reg4[63:0](.q(fifo[3]), .d(fifo_next[3]), .clk(clk), .rst(rst));   
   
   assign read_cmd = (pop_fifo & (~fifo_empty));
   assign write_cmd = (data_in_valid & (~fifo_full));
   
   assign rwcounter_next[0] = rst? 1'b1 : ((rwcounter[0] & read_cmd) | (rwcounter[1] & read_cmd) | fifo_empty);
   assign rwcounter_next[1] = ((rwcounter[0] & write_cmd) | (rwcounter[2] & read_cmd));
   assign rwcounter_next[2] = ((rwcounter[1] & write_cmd) | (rwcounter[3] & read_cmd));
   assign rwcounter_next[3] = ((rwcounter[2] & write_cmd) | (rwcounter[3] & write_cmd) | fifo_full);
   
   dff rw0(.q(rwcounter[0]), .d(rwcounter_next[0]), .clk(clk), .rst(rst));
   dff rw1(.q(rwcounter[1]), .d(rwcounter_next[1]), .clk(clk), .rst(rst));
   dff rw2(.q(rwcounter[2]), .d(rwcounter_next[2]), .clk(clk), .rst(rst));
   dff rw3(.q(rwcounter[3]), .d(rwcounter_next[3]), .clk(clk), .rst(rst));
   
   assign fifo_empty = rwcounter[0];
   assign fifo_full = rwcounter[3]; 
           
   dff rs1[1:0](.q(readstate), .d(readstate_next), .clk(clk), .rst(rst));
   dff ws1[1:0](.q(writestate), .d(writestate_next), .clk(clk), .rst(rst));
   
   assign readstate_next = (read_cmd)? (readstate + 1) : readstate;
   assign writestate_next = (write_cmd)? (writestate + 1) : writestate;
      
endmodule
// DUMMY LINE FOR REV CONTROL :1:

/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */

module sc( clk, rst, ctr_rst, out, err);
   input clk;
   input rst;
   input ctr_rst;
   output [2:0] out;
   output err;

   wire [2:0] next;
   wire       maxedOut;
   wire       doRst;
   
   dff d1(.q (out[0]), .d (next[0]), .clk (clk), .rst (doRst));
   dff d2(.q (out[1]), .d (next[1]), .clk (clk), .rst (doRst));
   dff d3(.q (out[2]), .d (next[2]), .clk (clk), .rst (doRst));
   
   assign doRst = rst | ctr_rst;
   assign maxedOut = (out == 3'b101);
   assign next[0] = (maxedOut) | (~maxedOut & ~out[0]);
   assign next[1] = ~maxedOut & ((out[0] & ~out[1]) | (out[1] & ~out[0]));
   assign next[2] = maxedOut | (~maxedOut & ((out[0] & out[1] & ~out[2]) | (~(out[0] & out[1]) & out[2])));
endmodule

// DUMMY LINE FOR REV CONTROL :1:

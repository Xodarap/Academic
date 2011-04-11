module forwarder(MRd, WRd, XRs, XRt, MRegWrite, WRegWrite,
		 XRegVal1, XRegVal2, MRegVal, WRegVal,
		 RegVal1, RegVal2);
   /* The naming convention here is to use the output of the FF.
      So MRd is the output of the X/M Flip Flop.
   */
   input [2:0] MRd, WRd, XRs, XRt;
   input [15:0] XRegVal1, XRegVal2, MRegVal, WRegVal;
   input 	MRegWrite, WRegWrite;
   output reg [15:0] RegVal1, RegVal2;
      
   wire [1:0] ForwardA, ForwardB;

   /* Forwarding[AB] definitions: 
      00 : No forwarding
      01 : Get from write back
      10 : Get from memory
    */
   
   assign ForwardA = // If we're writing to mem, use that instead
		     (MRegWrite & MRd != 3'b0 & MRd == XRs) ? 2'b10 :
		     // If we're writing back, but NOT writing to mem, use the WB value
		     (WRegWrite & WRd != 3'b0 & WRd == XRs) ? 2'b01 :
		     // Otherwise, just get it from the ID/EX FF
		     2'b00;
   
   assign ForwardB = // If we're writing to mem, use that instead
		     (MRegWrite & MRd != 3'b0 & MRd == XRt) ? 2'b10 :
		     // If we're writing back, but NOT writing to mem, use the WB value
		     (WRegWrite & WRd != 3'b0 & WRd == XRt) ? 2'b01 :
		     // Otherwise, just get it from the ID/EX FF
		     2'b00;
  
   always @(*) begin
      case (ForwardA)
	2'b00: RegVal1 = XRegVal1;
	2'b01: RegVal1 = WRegVal;
	2'b10: RegVal1 = MRegVal;
	2'b11: $display("Error: Invalid forwarding selection");
      endcase // case (ForwardA)
   end
   
   always @(*) begin
      case (ForwardB)
	2'b00: RegVal2 = XRegVal2;
	2'b01: RegVal2 = WRegVal;
	2'b10: RegVal2 = MRegVal;
	2'b11: $display("Error: Invalid forwarding selection");
      endcase // case (ForwardA)
   end
   		     
endmodule // forwarder

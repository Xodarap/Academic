module hazarddetector(XMemRead, XRt, DRs, DRt, MRd, XRd,MRegWrite, XRegWrite, RType, Stall);
   input XMemRead, MRegWrite, XRegWrite, RType;
   input [2:0] XRt, DRs, DRt, MRd, XRd;
   output Stall;
   wire   fmem, fex;
   
   assign fex = XRegWrite & (XRd == DRs | (XRd == DRt && RType));
   assign fmem= MRegWrite & (MRd == DRs | (MRd == DRt && RType));
   
   assign Stall = (XMemRead & (XRt == DRs | (XRt == DRt && RType))) | fex | fmem;
   
endmodule // hazarddetector

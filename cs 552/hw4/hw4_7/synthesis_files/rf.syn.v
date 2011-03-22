
module dff_127 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n2, n1, n3;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n2) );
  OR2X1 U4 ( .A(rst), .B(n2), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_126 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_125 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_124 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_123 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_122 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_121 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_120 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_119 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_118 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_117 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_116 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_115 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_114 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_113 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_112 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_111 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_110 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_109 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_108 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_107 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_106 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_105 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_104 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_103 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_102 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_101 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_100 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_99 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_98 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_97 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_96 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_95 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_94 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_93 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_92 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_91 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_90 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_89 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_88 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_87 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_86 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_85 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_84 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_83 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_82 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_81 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_80 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_79 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_78 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_77 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_76 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_75 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_74 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_73 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_72 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_71 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_70 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_69 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_68 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_67 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_66 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_65 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_64 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_63 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_62 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_61 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_60 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_59 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_58 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_57 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_56 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_55 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_54 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_53 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_52 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_51 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_50 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_49 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_48 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_47 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_46 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_45 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_44 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_43 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_42 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_41 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_40 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_39 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_38 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_37 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_36 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_35 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_34 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_33 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_32 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_31 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_30 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_29 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_28 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_27 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_26 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_25 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_24 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_23 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_22 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_21 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_20 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_19 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_18 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_17 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_16 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_15 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_14 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_13 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_12 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_11 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_10 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_9 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_8 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_7 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_6 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_5 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_4 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_3 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_2 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_1 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module dff_0 ( q, d, clk, rst );
  input d, clk, rst;
  output q;
  wire   n1, n3, n4;

  DFFPOSX1 state_reg ( .D(n3), .CLK(clk), .Q(q) );
  INVX1 U3 ( .A(d), .Y(n4) );
  OR2X1 U4 ( .A(rst), .B(n4), .Y(n1) );
  INVX1 U5 ( .A(n1), .Y(n3) );
endmodule


module onebitreg_127 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n1, n3, n2, n4;

  dff_127 data ( .q(readdata), .d(n1), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n3) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n3), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n1) );
endmodule


module onebitreg_126 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_126 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_125 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_125 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_124 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_124 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_123 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_123 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_122 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_122 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_121 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_121 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_120 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_120 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_119 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_119 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_118 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_118 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_117 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_117 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_116 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_116 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_115 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_115 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_114 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_114 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_113 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_113 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_112 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_112 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_111 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_111 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_110 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_110 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_109 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_109 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_108 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_108 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_107 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_107 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_106 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_106 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_105 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_105 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_104 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_104 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_103 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_103 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_102 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_102 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_101 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_101 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_100 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_100 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_99 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_99 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_98 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_98 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_97 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_97 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_96 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_96 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_95 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_95 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_94 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_94 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_93 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_93 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_92 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_92 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_91 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_91 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_90 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_90 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_89 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_89 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_88 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_88 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_87 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_87 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_86 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_86 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_85 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_85 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_84 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_84 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_83 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_83 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_82 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_82 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_81 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_81 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_80 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_80 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_79 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_79 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_78 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_78 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_77 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_77 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_76 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_76 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_75 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_75 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_74 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_74 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_73 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_73 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_72 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_72 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_71 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_71 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_70 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_70 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_69 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_69 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_68 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_68 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_67 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_67 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_66 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_66 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_65 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_65 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_64 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_64 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_63 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_63 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_62 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_62 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_61 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_61 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_60 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_60 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_59 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_59 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_58 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_58 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_57 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_57 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_56 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_56 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_55 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_55 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_54 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_54 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_53 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_53 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(write), .Y(n5) );
  INVX1 U2 ( .A(n5), .Y(n4) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_52 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_52 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_51 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_51 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_50 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_50 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_49 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_49 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_48 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_48 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_47 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_47 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_46 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_46 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_45 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_45 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_44 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_44 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_43 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_43 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_42 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_42 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_41 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_41 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_40 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_40 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_39 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_39 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_38 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_38 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_37 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_37 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_36 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_36 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_35 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_35 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_34 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_34 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_33 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_33 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_32 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_32 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_31 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_31 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_30 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_30 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_29 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_29 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_28 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_28 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_27 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_27 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_26 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_26 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_25 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_25 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_24 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_24 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_23 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_23 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_22 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_22 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_21 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_21 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_20 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_20 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_19 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_19 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_18 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_18 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_17 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_17 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_16 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_16 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_15 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_15 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_14 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_14 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_13 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_13 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_12 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_12 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_11 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_11 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_10 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_10 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_9 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_9 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_8 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_8 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_7 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_7 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_6 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_6 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_5 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6, n7;

  dff_5 data ( .q(readdata), .d(n7), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n5), .C(writedata), .D(n4), .Y(n6) );
  INVX1 U1 ( .A(n5), .Y(n4) );
  INVX1 U2 ( .A(write), .Y(n5) );
  BUFX2 U4 ( .A(n6), .Y(n2) );
  INVX1 U5 ( .A(n2), .Y(n7) );
endmodule


module onebitreg_4 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_4 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_3 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_3 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_2 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_2 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_1 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_1 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module onebitreg_0 ( readdata, clk, rst, writedata, write );
  input clk, rst, writedata, write;
  output readdata;
  wire   n2, n4, n5, n6;

  dff_0 data ( .q(readdata), .d(n6), .clk(clk), .rst(rst) );
  AOI22X1 U3 ( .A(readdata), .B(n4), .C(writedata), .D(write), .Y(n5) );
  INVX1 U1 ( .A(write), .Y(n4) );
  BUFX2 U2 ( .A(n5), .Y(n2) );
  INVX1 U4 ( .A(n2), .Y(n6) );
endmodule


module reg16_7 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_127 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(n1) );
  onebitreg_126 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_125 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_124 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(n1) );
  onebitreg_123 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(write) );
  onebitreg_122 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_121 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_120 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_119 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_118 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_117 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_116 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_115 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_114 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_113 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_112 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_6 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_111 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(write) );
  onebitreg_110 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_109 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(n1) );
  onebitreg_108 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_107 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_106 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_105 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_104 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_103 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_102 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_101 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_100 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_99 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_98 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_97 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_96 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_5 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_95 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(write) );
  onebitreg_94 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(n1) );
  onebitreg_93 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_92 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_91 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_90 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_89 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_88 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_87 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_86 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_85 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_84 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_83 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_82 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_81 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_80 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_4 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_79 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(write) );
  onebitreg_78 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_77 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_76 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(n1) );
  onebitreg_75 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_74 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_73 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_72 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_71 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_70 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_69 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_68 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_67 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_66 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_65 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_64 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_3 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_63 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(write) );
  onebitreg_62 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_61 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(n1) );
  onebitreg_60 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_59 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_58 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_57 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_56 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_55 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_54 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_53 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_52 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_51 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_50 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_49 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_48 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_2 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_47 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(n1) );
  onebitreg_46 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_45 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_44 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_43 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_42 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_41 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_40 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_39 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_38 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_37 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_36 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_35 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_34 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_33 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_32 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_1 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_31 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(n1) );
  onebitreg_30 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_29 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_28 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_27 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_26 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_25 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<6> ), .write(n1) );
  onebitreg_24 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<7> ), .write(n1) );
  onebitreg_23 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<8> ), .write(n1) );
  onebitreg_22 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<9> ), .write(n1) );
  onebitreg_21 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_20 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_19 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_18 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_17 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_16 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module reg16_0 ( .readdata({\readdata<15> , \readdata<14> , \readdata<13> , 
        \readdata<12> , \readdata<11> , \readdata<10> , \readdata<9> , 
        \readdata<8> , \readdata<7> , \readdata<6> , \readdata<5> , 
        \readdata<4> , \readdata<3> , \readdata<2> , \readdata<1> , 
        \readdata<0> }), clk, rst, .writedata({\writedata<15> , 
        \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> , 
        \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> , 
        \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> , 
        \writedata<2> , \writedata<1> , \writedata<0> }), write );
  input clk, rst, \writedata<15> , \writedata<14> , \writedata<13> ,
         \writedata<12> , \writedata<11> , \writedata<10> , \writedata<9> ,
         \writedata<8> , \writedata<7> , \writedata<6> , \writedata<5> ,
         \writedata<4> , \writedata<3> , \writedata<2> , \writedata<1> ,
         \writedata<0> , write;
  output \readdata<15> , \readdata<14> , \readdata<13> , \readdata<12> ,
         \readdata<11> , \readdata<10> , \readdata<9> , \readdata<8> ,
         \readdata<7> , \readdata<6> , \readdata<5> , \readdata<4> ,
         \readdata<3> , \readdata<2> , \readdata<1> , \readdata<0> ;
  wire   n1, n2;

  onebitreg_15 r0 ( .readdata(\readdata<0> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<0> ), .write(n1) );
  onebitreg_14 r1 ( .readdata(\readdata<1> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<1> ), .write(write) );
  onebitreg_13 r2 ( .readdata(\readdata<2> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<2> ), .write(write) );
  onebitreg_12 r3 ( .readdata(\readdata<3> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<3> ), .write(write) );
  onebitreg_11 r4 ( .readdata(\readdata<4> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<4> ), .write(n1) );
  onebitreg_10 r5 ( .readdata(\readdata<5> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<5> ), .write(n1) );
  onebitreg_9 r6 ( .readdata(\readdata<6> ), .clk(clk), .rst(rst), .writedata(
        \writedata<6> ), .write(n1) );
  onebitreg_8 r7 ( .readdata(\readdata<7> ), .clk(clk), .rst(rst), .writedata(
        \writedata<7> ), .write(n1) );
  onebitreg_7 r8 ( .readdata(\readdata<8> ), .clk(clk), .rst(rst), .writedata(
        \writedata<8> ), .write(n1) );
  onebitreg_6 r9 ( .readdata(\readdata<9> ), .clk(clk), .rst(rst), .writedata(
        \writedata<9> ), .write(n1) );
  onebitreg_5 r10 ( .readdata(\readdata<10> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<10> ), .write(n1) );
  onebitreg_4 r11 ( .readdata(\readdata<11> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<11> ), .write(n1) );
  onebitreg_3 r12 ( .readdata(\readdata<12> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<12> ), .write(n1) );
  onebitreg_2 r13 ( .readdata(\readdata<13> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<13> ), .write(n1) );
  onebitreg_1 r14 ( .readdata(\readdata<14> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<14> ), .write(n1) );
  onebitreg_0 r15 ( .readdata(\readdata<15> ), .clk(clk), .rst(rst), 
        .writedata(\writedata<15> ), .write(n1) );
  INVX1 U1 ( .A(write), .Y(n2) );
  INVX1 U2 ( .A(n2), .Y(n1) );
endmodule


module rf ( .read1data({\read1data<15> , \read1data<14> , \read1data<13> , 
        \read1data<12> , \read1data<11> , \read1data<10> , \read1data<9> , 
        \read1data<8> , \read1data<7> , \read1data<6> , \read1data<5> , 
        \read1data<4> , \read1data<3> , \read1data<2> , \read1data<1> , 
        \read1data<0> }), .read2data({\read2data<15> , \read2data<14> , 
        \read2data<13> , \read2data<12> , \read2data<11> , \read2data<10> , 
        \read2data<9> , \read2data<8> , \read2data<7> , \read2data<6> , 
        \read2data<5> , \read2data<4> , \read2data<3> , \read2data<2> , 
        \read2data<1> , \read2data<0> }), err, clk, rst, .read1regsel({
        \read1regsel<2> , \read1regsel<1> , \read1regsel<0> }), .read2regsel({
        \read2regsel<2> , \read2regsel<1> , \read2regsel<0> }), .writeregsel({
        \writeregsel<2> , \writeregsel<1> , \writeregsel<0> }), .writedata({
        \writedata<15> , \writedata<14> , \writedata<13> , \writedata<12> , 
        \writedata<11> , \writedata<10> , \writedata<9> , \writedata<8> , 
        \writedata<7> , \writedata<6> , \writedata<5> , \writedata<4> , 
        \writedata<3> , \writedata<2> , \writedata<1> , \writedata<0> }), 
        write );
  input clk, rst, \read1regsel<2> , \read1regsel<1> , \read1regsel<0> ,
         \read2regsel<2> , \read2regsel<1> , \read2regsel<0> ,
         \writeregsel<2> , \writeregsel<1> , \writeregsel<0> , \writedata<15> ,
         \writedata<14> , \writedata<13> , \writedata<12> , \writedata<11> ,
         \writedata<10> , \writedata<9> , \writedata<8> , \writedata<7> ,
         \writedata<6> , \writedata<5> , \writedata<4> , \writedata<3> ,
         \writedata<2> , \writedata<1> , \writedata<0> , write;
  output \read1data<15> , \read1data<14> , \read1data<13> , \read1data<12> ,
         \read1data<11> , \read1data<10> , \read1data<9> , \read1data<8> ,
         \read1data<7> , \read1data<6> , \read1data<5> , \read1data<4> ,
         \read1data<3> , \read1data<2> , \read1data<1> , \read1data<0> ,
         \read2data<15> , \read2data<14> , \read2data<13> , \read2data<12> ,
         \read2data<11> , \read2data<10> , \read2data<9> , \read2data<8> ,
         \read2data<7> , \read2data<6> , \read2data<5> , \read2data<4> ,
         \read2data<3> , \read2data<2> , \read2data<1> , \read2data<0> , err;
  wire   \writeEnable<7> , \writeEnable<6> , \writeEnable<5> ,
         \writeEnable<4> , \writeEnable<3> , \writeEnable<2> ,
         \writeEnable<1> , \writeEnable<0> , \readDatas<127> ,
         \readDatas<126> , \readDatas<125> , \readDatas<124> ,
         \readDatas<123> , \readDatas<122> , \readDatas<121> ,
         \readDatas<120> , \readDatas<119> , \readDatas<118> ,
         \readDatas<117> , \readDatas<116> , \readDatas<115> ,
         \readDatas<114> , \readDatas<113> , \readDatas<112> ,
         \readDatas<111> , \readDatas<110> , \readDatas<109> ,
         \readDatas<108> , \readDatas<107> , \readDatas<106> ,
         \readDatas<105> , \readDatas<104> , \readDatas<103> ,
         \readDatas<102> , \readDatas<101> , \readDatas<100> , \readDatas<99> ,
         \readDatas<98> , \readDatas<97> , \readDatas<96> , \readDatas<95> ,
         \readDatas<94> , \readDatas<93> , \readDatas<92> , \readDatas<91> ,
         \readDatas<90> , \readDatas<89> , \readDatas<88> , \readDatas<87> ,
         \readDatas<86> , \readDatas<85> , \readDatas<84> , \readDatas<83> ,
         \readDatas<82> , \readDatas<81> , \readDatas<80> , \readDatas<79> ,
         \readDatas<78> , \readDatas<77> , \readDatas<76> , \readDatas<75> ,
         \readDatas<74> , \readDatas<73> , \readDatas<72> , \readDatas<71> ,
         \readDatas<70> , \readDatas<69> , \readDatas<68> , \readDatas<67> ,
         \readDatas<66> , \readDatas<65> , \readDatas<64> , \readDatas<63> ,
         \readDatas<62> , \readDatas<61> , \readDatas<60> , \readDatas<59> ,
         \readDatas<58> , \readDatas<57> , \readDatas<56> , \readDatas<55> ,
         \readDatas<54> , \readDatas<53> , \readDatas<52> , \readDatas<51> ,
         \readDatas<50> , \readDatas<49> , \readDatas<48> , \readDatas<47> ,
         \readDatas<46> , \readDatas<45> , \readDatas<44> , \readDatas<43> ,
         \readDatas<42> , \readDatas<41> , \readDatas<40> , \readDatas<39> ,
         \readDatas<38> , \readDatas<37> , \readDatas<36> , \readDatas<35> ,
         \readDatas<34> , \readDatas<33> , \readDatas<32> , \readDatas<31> ,
         \readDatas<30> , \readDatas<29> , \readDatas<28> , \readDatas<27> ,
         \readDatas<26> , \readDatas<25> , \readDatas<24> , \readDatas<23> ,
         \readDatas<22> , \readDatas<21> , \readDatas<20> , \readDatas<19> ,
         \readDatas<18> , \readDatas<17> , \readDatas<16> , \readDatas<15> ,
         \readDatas<14> , \readDatas<13> , \readDatas<12> , \readDatas<11> ,
         \readDatas<10> , \readDatas<9> , \readDatas<8> , \readDatas<7> ,
         \readDatas<6> , \readDatas<5> , \readDatas<4> , \readDatas<3> ,
         \readDatas<2> , \readDatas<1> , \readDatas<0> , n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362;

  reg16_7 r0 ( .readdata({\readDatas<15> , \readDatas<14> , \readDatas<13> , 
        \readDatas<12> , \readDatas<11> , \readDatas<10> , \readDatas<9> , 
        \readDatas<8> , \readDatas<7> , \readDatas<6> , \readDatas<5> , 
        \readDatas<4> , \readDatas<3> , \readDatas<2> , \readDatas<1> , 
        \readDatas<0> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<0> ) );
  reg16_6 r1 ( .readdata({\readDatas<31> , \readDatas<30> , \readDatas<29> , 
        \readDatas<28> , \readDatas<27> , \readDatas<26> , \readDatas<25> , 
        \readDatas<24> , \readDatas<23> , \readDatas<22> , \readDatas<21> , 
        \readDatas<20> , \readDatas<19> , \readDatas<18> , \readDatas<17> , 
        \readDatas<16> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<1> ) );
  reg16_5 r2 ( .readdata({\readDatas<47> , \readDatas<46> , \readDatas<45> , 
        \readDatas<44> , \readDatas<43> , \readDatas<42> , \readDatas<41> , 
        \readDatas<40> , \readDatas<39> , \readDatas<38> , \readDatas<37> , 
        \readDatas<36> , \readDatas<35> , \readDatas<34> , \readDatas<33> , 
        \readDatas<32> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<2> ) );
  reg16_4 r3 ( .readdata({\readDatas<63> , \readDatas<62> , \readDatas<61> , 
        \readDatas<60> , \readDatas<59> , \readDatas<58> , \readDatas<57> , 
        \readDatas<56> , \readDatas<55> , \readDatas<54> , \readDatas<53> , 
        \readDatas<52> , \readDatas<51> , \readDatas<50> , \readDatas<49> , 
        \readDatas<48> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<3> ) );
  reg16_3 r4 ( .readdata({\readDatas<79> , \readDatas<78> , \readDatas<77> , 
        \readDatas<76> , \readDatas<75> , \readDatas<74> , \readDatas<73> , 
        \readDatas<72> , \readDatas<71> , \readDatas<70> , \readDatas<69> , 
        \readDatas<68> , \readDatas<67> , \readDatas<66> , \readDatas<65> , 
        \readDatas<64> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<4> ) );
  reg16_2 r5 ( .readdata({\readDatas<95> , \readDatas<94> , \readDatas<93> , 
        \readDatas<92> , \readDatas<91> , \readDatas<90> , \readDatas<89> , 
        \readDatas<88> , \readDatas<87> , \readDatas<86> , \readDatas<85> , 
        \readDatas<84> , \readDatas<83> , \readDatas<82> , \readDatas<81> , 
        \readDatas<80> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<5> ) );
  reg16_1 r6 ( .readdata({\readDatas<111> , \readDatas<110> , \readDatas<109> , 
        \readDatas<108> , \readDatas<107> , \readDatas<106> , \readDatas<105> , 
        \readDatas<104> , \readDatas<103> , \readDatas<102> , \readDatas<101> , 
        \readDatas<100> , \readDatas<99> , \readDatas<98> , \readDatas<97> , 
        \readDatas<96> }), .clk(clk), .rst(n361), .writedata({n350, n349, n348, 
        n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, n336, 
        n335}), .write(\writeEnable<6> ) );
  reg16_0 r7 ( .readdata({\readDatas<127> , \readDatas<126> , \readDatas<125> , 
        \readDatas<124> , \readDatas<123> , \readDatas<122> , \readDatas<121> , 
        \readDatas<120> , \readDatas<119> , \readDatas<118> , \readDatas<117> , 
        \readDatas<116> , \readDatas<115> , \readDatas<114> , \readDatas<113> , 
        \readDatas<112> }), .clk(clk), .rst(n361), .writedata({n350, n349, 
        n348, n347, n346, n345, n344, n343, n342, n341, n340, n339, n338, n337, 
        n336, n335}), .write(\writeEnable<7> ) );
  NOR3X1 U48 ( .A(n15), .B(n334), .C(n16), .Y(\writeEnable<7> ) );
  NOR3X1 U49 ( .A(n15), .B(\writeregsel<0> ), .C(n334), .Y(\writeEnable<6> )
         );
  NOR3X1 U50 ( .A(n16), .B(\writeregsel<1> ), .C(n334), .Y(\writeEnable<5> )
         );
  NOR3X1 U51 ( .A(n334), .B(\writeregsel<1> ), .C(\writeregsel<0> ), .Y(
        \writeEnable<4> ) );
  NOR3X1 U53 ( .A(n332), .B(n16), .C(n15), .Y(\writeEnable<3> ) );
  NOR3X1 U54 ( .A(n332), .B(\writeregsel<0> ), .C(n15), .Y(\writeEnable<2> )
         );
  NOR3X1 U55 ( .A(n332), .B(\writeregsel<1> ), .C(n16), .Y(\writeEnable<1> )
         );
  NOR3X1 U56 ( .A(n332), .B(\writeregsel<1> ), .C(\writeregsel<0> ), .Y(
        \writeEnable<0> ) );
  NAND3X1 U58 ( .A(n290), .B(n322), .C(n21), .Y(\read2data<9> ) );
  AOI22X1 U59 ( .A(\readDatas<121> ), .B(n9), .C(\readDatas<105> ), .D(n8), 
        .Y(n23) );
  AOI22X1 U60 ( .A(\readDatas<89> ), .B(n11), .C(\readDatas<73> ), .D(n10), 
        .Y(n22) );
  AOI22X1 U61 ( .A(\readDatas<57> ), .B(n359), .C(\readDatas<41> ), .D(n360), 
        .Y(n20) );
  AOI22X1 U62 ( .A(\readDatas<25> ), .B(n357), .C(\readDatas<9> ), .D(n358), 
        .Y(n19) );
  NAND3X1 U63 ( .A(n289), .B(n321), .C(n30), .Y(\read2data<8> ) );
  AOI22X1 U64 ( .A(\readDatas<120> ), .B(n9), .C(\readDatas<104> ), .D(n8), 
        .Y(n32) );
  AOI22X1 U65 ( .A(\readDatas<88> ), .B(n11), .C(\readDatas<72> ), .D(n10), 
        .Y(n31) );
  AOI22X1 U66 ( .A(\readDatas<56> ), .B(n359), .C(\readDatas<40> ), .D(n360), 
        .Y(n29) );
  AOI22X1 U67 ( .A(\readDatas<24> ), .B(n357), .C(\readDatas<8> ), .D(n358), 
        .Y(n28) );
  NAND3X1 U68 ( .A(n288), .B(n320), .C(n35), .Y(\read2data<7> ) );
  AOI22X1 U69 ( .A(\readDatas<119> ), .B(n9), .C(\readDatas<103> ), .D(n8), 
        .Y(n37) );
  AOI22X1 U70 ( .A(\readDatas<87> ), .B(n11), .C(\readDatas<71> ), .D(n10), 
        .Y(n36) );
  AOI22X1 U71 ( .A(\readDatas<55> ), .B(n359), .C(\readDatas<39> ), .D(n360), 
        .Y(n34) );
  AOI22X1 U72 ( .A(\readDatas<23> ), .B(n357), .C(\readDatas<7> ), .D(n358), 
        .Y(n33) );
  NAND3X1 U73 ( .A(n287), .B(n319), .C(n40), .Y(\read2data<6> ) );
  AOI22X1 U74 ( .A(\readDatas<118> ), .B(n9), .C(\readDatas<102> ), .D(n8), 
        .Y(n42) );
  AOI22X1 U75 ( .A(\readDatas<86> ), .B(n11), .C(\readDatas<70> ), .D(n10), 
        .Y(n41) );
  AOI22X1 U76 ( .A(\readDatas<54> ), .B(n359), .C(\readDatas<38> ), .D(n360), 
        .Y(n39) );
  AOI22X1 U77 ( .A(\readDatas<22> ), .B(n357), .C(\readDatas<6> ), .D(n358), 
        .Y(n38) );
  NAND3X1 U78 ( .A(n286), .B(n318), .C(n45), .Y(\read2data<5> ) );
  AOI22X1 U79 ( .A(\readDatas<117> ), .B(n9), .C(\readDatas<101> ), .D(n8), 
        .Y(n47) );
  AOI22X1 U80 ( .A(\readDatas<85> ), .B(n11), .C(\readDatas<69> ), .D(n10), 
        .Y(n46) );
  AOI22X1 U81 ( .A(\readDatas<53> ), .B(n359), .C(\readDatas<37> ), .D(n360), 
        .Y(n44) );
  AOI22X1 U82 ( .A(\readDatas<21> ), .B(n357), .C(\readDatas<5> ), .D(n358), 
        .Y(n43) );
  NAND3X1 U83 ( .A(n285), .B(n317), .C(n50), .Y(\read2data<4> ) );
  AOI22X1 U84 ( .A(\readDatas<116> ), .B(n9), .C(\readDatas<100> ), .D(n8), 
        .Y(n52) );
  AOI22X1 U85 ( .A(\readDatas<84> ), .B(n11), .C(\readDatas<68> ), .D(n10), 
        .Y(n51) );
  AOI22X1 U86 ( .A(\readDatas<52> ), .B(n359), .C(\readDatas<36> ), .D(n360), 
        .Y(n49) );
  AOI22X1 U87 ( .A(\readDatas<20> ), .B(n357), .C(\readDatas<4> ), .D(n358), 
        .Y(n48) );
  NAND3X1 U88 ( .A(n284), .B(n316), .C(n55), .Y(\read2data<3> ) );
  AOI22X1 U89 ( .A(\readDatas<115> ), .B(n9), .C(\readDatas<99> ), .D(n8), .Y(
        n57) );
  AOI22X1 U90 ( .A(\readDatas<83> ), .B(n11), .C(\readDatas<67> ), .D(n10), 
        .Y(n56) );
  AOI22X1 U91 ( .A(\readDatas<51> ), .B(n359), .C(\readDatas<35> ), .D(n360), 
        .Y(n54) );
  AOI22X1 U92 ( .A(\readDatas<19> ), .B(n357), .C(\readDatas<3> ), .D(n358), 
        .Y(n53) );
  NAND3X1 U93 ( .A(n283), .B(n315), .C(n60), .Y(\read2data<2> ) );
  AOI22X1 U94 ( .A(\readDatas<114> ), .B(n9), .C(\readDatas<98> ), .D(n8), .Y(
        n62) );
  AOI22X1 U95 ( .A(\readDatas<82> ), .B(n11), .C(\readDatas<66> ), .D(n10), 
        .Y(n61) );
  AOI22X1 U96 ( .A(\readDatas<50> ), .B(n359), .C(\readDatas<34> ), .D(n360), 
        .Y(n59) );
  AOI22X1 U97 ( .A(\readDatas<18> ), .B(n357), .C(\readDatas<2> ), .D(n358), 
        .Y(n58) );
  NAND3X1 U98 ( .A(n282), .B(n314), .C(n65), .Y(\read2data<1> ) );
  AOI22X1 U99 ( .A(\readDatas<113> ), .B(n9), .C(\readDatas<97> ), .D(n8), .Y(
        n67) );
  AOI22X1 U100 ( .A(\readDatas<81> ), .B(n11), .C(\readDatas<65> ), .D(n10), 
        .Y(n66) );
  AOI22X1 U101 ( .A(\readDatas<49> ), .B(n359), .C(\readDatas<33> ), .D(n360), 
        .Y(n64) );
  AOI22X1 U102 ( .A(\readDatas<17> ), .B(n357), .C(\readDatas<1> ), .D(n358), 
        .Y(n63) );
  NAND3X1 U103 ( .A(n281), .B(n313), .C(n70), .Y(\read2data<15> ) );
  AOI22X1 U104 ( .A(\readDatas<127> ), .B(n9), .C(\readDatas<111> ), .D(n8), 
        .Y(n72) );
  AOI22X1 U105 ( .A(\readDatas<95> ), .B(n11), .C(\readDatas<79> ), .D(n10), 
        .Y(n71) );
  AOI22X1 U106 ( .A(\readDatas<63> ), .B(n359), .C(\readDatas<47> ), .D(n360), 
        .Y(n69) );
  AOI22X1 U107 ( .A(\readDatas<31> ), .B(n357), .C(\readDatas<15> ), .D(n358), 
        .Y(n68) );
  NAND3X1 U108 ( .A(n280), .B(n312), .C(n75), .Y(\read2data<14> ) );
  AOI22X1 U109 ( .A(\readDatas<126> ), .B(n9), .C(\readDatas<110> ), .D(n8), 
        .Y(n77) );
  AOI22X1 U110 ( .A(\readDatas<94> ), .B(n11), .C(\readDatas<78> ), .D(n10), 
        .Y(n76) );
  AOI22X1 U111 ( .A(\readDatas<62> ), .B(n359), .C(\readDatas<46> ), .D(n360), 
        .Y(n74) );
  AOI22X1 U112 ( .A(\readDatas<30> ), .B(n357), .C(\readDatas<14> ), .D(n358), 
        .Y(n73) );
  NAND3X1 U113 ( .A(n279), .B(n311), .C(n80), .Y(\read2data<13> ) );
  AOI22X1 U114 ( .A(\readDatas<125> ), .B(n9), .C(\readDatas<109> ), .D(n8), 
        .Y(n82) );
  AOI22X1 U115 ( .A(\readDatas<93> ), .B(n11), .C(\readDatas<77> ), .D(n10), 
        .Y(n81) );
  AOI22X1 U116 ( .A(\readDatas<61> ), .B(n359), .C(\readDatas<45> ), .D(n360), 
        .Y(n79) );
  AOI22X1 U117 ( .A(\readDatas<29> ), .B(n357), .C(\readDatas<13> ), .D(n358), 
        .Y(n78) );
  NAND3X1 U118 ( .A(n278), .B(n310), .C(n85), .Y(\read2data<12> ) );
  AOI22X1 U119 ( .A(\readDatas<124> ), .B(n9), .C(\readDatas<108> ), .D(n8), 
        .Y(n87) );
  AOI22X1 U120 ( .A(\readDatas<92> ), .B(n11), .C(\readDatas<76> ), .D(n10), 
        .Y(n86) );
  AOI22X1 U121 ( .A(\readDatas<60> ), .B(n359), .C(\readDatas<44> ), .D(n360), 
        .Y(n84) );
  AOI22X1 U122 ( .A(\readDatas<28> ), .B(n357), .C(\readDatas<12> ), .D(n358), 
        .Y(n83) );
  NAND3X1 U123 ( .A(n277), .B(n309), .C(n90), .Y(\read2data<11> ) );
  AOI22X1 U124 ( .A(\readDatas<123> ), .B(n9), .C(\readDatas<107> ), .D(n8), 
        .Y(n92) );
  AOI22X1 U125 ( .A(\readDatas<91> ), .B(n11), .C(\readDatas<75> ), .D(n10), 
        .Y(n91) );
  AOI22X1 U126 ( .A(\readDatas<59> ), .B(n359), .C(\readDatas<43> ), .D(n360), 
        .Y(n89) );
  AOI22X1 U127 ( .A(\readDatas<27> ), .B(n357), .C(\readDatas<11> ), .D(n358), 
        .Y(n88) );
  NAND3X1 U128 ( .A(n276), .B(n308), .C(n95), .Y(\read2data<10> ) );
  AOI22X1 U129 ( .A(\readDatas<122> ), .B(n9), .C(\readDatas<106> ), .D(n8), 
        .Y(n97) );
  AOI22X1 U130 ( .A(\readDatas<90> ), .B(n11), .C(\readDatas<74> ), .D(n10), 
        .Y(n96) );
  AOI22X1 U131 ( .A(\readDatas<58> ), .B(n359), .C(\readDatas<42> ), .D(n360), 
        .Y(n94) );
  AOI22X1 U132 ( .A(\readDatas<26> ), .B(n357), .C(\readDatas<10> ), .D(n358), 
        .Y(n93) );
  NAND3X1 U133 ( .A(n275), .B(n307), .C(n100), .Y(\read2data<0> ) );
  AOI22X1 U134 ( .A(\readDatas<112> ), .B(n9), .C(\readDatas<96> ), .D(n8), 
        .Y(n102) );
  NAND3X1 U135 ( .A(\read2regsel<1> ), .B(n13), .C(n351), .Y(n103) );
  NAND3X1 U136 ( .A(\read2regsel<1> ), .B(\read2regsel<0> ), .C(n351), .Y(n104) );
  AOI22X1 U137 ( .A(\readDatas<80> ), .B(n11), .C(\readDatas<64> ), .D(n10), 
        .Y(n101) );
  NAND3X1 U138 ( .A(n13), .B(n12), .C(n351), .Y(n105) );
  NAND3X1 U139 ( .A(\read2regsel<0> ), .B(n12), .C(n351), .Y(n106) );
  AOI22X1 U140 ( .A(\readDatas<48> ), .B(n359), .C(\readDatas<32> ), .D(n360), 
        .Y(n99) );
  NOR3X1 U141 ( .A(\read2regsel<0> ), .B(n351), .C(n12), .Y(n25) );
  NOR3X1 U142 ( .A(n13), .B(n351), .C(n12), .Y(n24) );
  AOI22X1 U143 ( .A(\readDatas<16> ), .B(n357), .C(\readDatas<0> ), .D(n358), 
        .Y(n98) );
  NOR3X1 U144 ( .A(\read2regsel<1> ), .B(n351), .C(\read2regsel<0> ), .Y(n27)
         );
  NOR3X1 U145 ( .A(\read2regsel<1> ), .B(n351), .C(n13), .Y(n26) );
  NAND3X1 U146 ( .A(n274), .B(n306), .C(n109), .Y(\read1data<9> ) );
  AOI22X1 U147 ( .A(n3), .B(\readDatas<121> ), .C(n2), .D(\readDatas<105> ), 
        .Y(n111) );
  AOI22X1 U148 ( .A(n5), .B(\readDatas<89> ), .C(n4), .D(\readDatas<73> ), .Y(
        n110) );
  AOI22X1 U149 ( .A(n355), .B(\readDatas<57> ), .C(n356), .D(\readDatas<41> ), 
        .Y(n108) );
  AOI22X1 U150 ( .A(n353), .B(\readDatas<25> ), .C(n354), .D(\readDatas<9> ), 
        .Y(n107) );
  NAND3X1 U151 ( .A(n273), .B(n305), .C(n118), .Y(\read1data<8> ) );
  AOI22X1 U152 ( .A(n3), .B(\readDatas<120> ), .C(n2), .D(\readDatas<104> ), 
        .Y(n120) );
  AOI22X1 U153 ( .A(n5), .B(\readDatas<88> ), .C(n4), .D(\readDatas<72> ), .Y(
        n119) );
  AOI22X1 U154 ( .A(n355), .B(\readDatas<56> ), .C(n356), .D(\readDatas<40> ), 
        .Y(n117) );
  AOI22X1 U155 ( .A(n353), .B(\readDatas<24> ), .C(n354), .D(\readDatas<8> ), 
        .Y(n116) );
  NAND3X1 U156 ( .A(n272), .B(n304), .C(n123), .Y(\read1data<7> ) );
  AOI22X1 U157 ( .A(n3), .B(\readDatas<119> ), .C(n2), .D(\readDatas<103> ), 
        .Y(n125) );
  AOI22X1 U158 ( .A(n5), .B(\readDatas<87> ), .C(n4), .D(\readDatas<71> ), .Y(
        n124) );
  AOI22X1 U159 ( .A(n355), .B(\readDatas<55> ), .C(n356), .D(\readDatas<39> ), 
        .Y(n122) );
  AOI22X1 U160 ( .A(n353), .B(\readDatas<23> ), .C(n354), .D(\readDatas<7> ), 
        .Y(n121) );
  NAND3X1 U161 ( .A(n271), .B(n303), .C(n128), .Y(\read1data<6> ) );
  AOI22X1 U162 ( .A(n3), .B(\readDatas<118> ), .C(n2), .D(\readDatas<102> ), 
        .Y(n130) );
  AOI22X1 U163 ( .A(n5), .B(\readDatas<86> ), .C(n4), .D(\readDatas<70> ), .Y(
        n129) );
  AOI22X1 U164 ( .A(n355), .B(\readDatas<54> ), .C(n356), .D(\readDatas<38> ), 
        .Y(n127) );
  AOI22X1 U165 ( .A(n353), .B(\readDatas<22> ), .C(n354), .D(\readDatas<6> ), 
        .Y(n126) );
  NAND3X1 U166 ( .A(n270), .B(n302), .C(n133), .Y(\read1data<5> ) );
  AOI22X1 U167 ( .A(n3), .B(\readDatas<117> ), .C(n2), .D(\readDatas<101> ), 
        .Y(n135) );
  AOI22X1 U168 ( .A(n5), .B(\readDatas<85> ), .C(n4), .D(\readDatas<69> ), .Y(
        n134) );
  AOI22X1 U169 ( .A(n355), .B(\readDatas<53> ), .C(n356), .D(\readDatas<37> ), 
        .Y(n132) );
  AOI22X1 U170 ( .A(n353), .B(\readDatas<21> ), .C(n354), .D(\readDatas<5> ), 
        .Y(n131) );
  NAND3X1 U171 ( .A(n269), .B(n301), .C(n138), .Y(\read1data<4> ) );
  AOI22X1 U172 ( .A(n3), .B(\readDatas<116> ), .C(n2), .D(\readDatas<100> ), 
        .Y(n140) );
  AOI22X1 U173 ( .A(n5), .B(\readDatas<84> ), .C(n4), .D(\readDatas<68> ), .Y(
        n139) );
  AOI22X1 U174 ( .A(n355), .B(\readDatas<52> ), .C(n356), .D(\readDatas<36> ), 
        .Y(n137) );
  AOI22X1 U175 ( .A(n353), .B(\readDatas<20> ), .C(n354), .D(\readDatas<4> ), 
        .Y(n136) );
  NAND3X1 U176 ( .A(n268), .B(n300), .C(n143), .Y(\read1data<3> ) );
  AOI22X1 U177 ( .A(n3), .B(\readDatas<115> ), .C(n2), .D(\readDatas<99> ), 
        .Y(n145) );
  AOI22X1 U178 ( .A(n5), .B(\readDatas<83> ), .C(n4), .D(\readDatas<67> ), .Y(
        n144) );
  AOI22X1 U179 ( .A(n355), .B(\readDatas<51> ), .C(n356), .D(\readDatas<35> ), 
        .Y(n142) );
  AOI22X1 U180 ( .A(n353), .B(\readDatas<19> ), .C(n354), .D(\readDatas<3> ), 
        .Y(n141) );
  NAND3X1 U181 ( .A(n267), .B(n299), .C(n148), .Y(\read1data<2> ) );
  AOI22X1 U182 ( .A(n3), .B(\readDatas<114> ), .C(n2), .D(\readDatas<98> ), 
        .Y(n150) );
  AOI22X1 U183 ( .A(n5), .B(\readDatas<82> ), .C(n4), .D(\readDatas<66> ), .Y(
        n149) );
  AOI22X1 U184 ( .A(n355), .B(\readDatas<50> ), .C(n356), .D(\readDatas<34> ), 
        .Y(n147) );
  AOI22X1 U185 ( .A(n353), .B(\readDatas<18> ), .C(n354), .D(\readDatas<2> ), 
        .Y(n146) );
  NAND3X1 U186 ( .A(n266), .B(n298), .C(n153), .Y(\read1data<1> ) );
  AOI22X1 U187 ( .A(n3), .B(\readDatas<113> ), .C(n2), .D(\readDatas<97> ), 
        .Y(n155) );
  AOI22X1 U188 ( .A(n5), .B(\readDatas<81> ), .C(n4), .D(\readDatas<65> ), .Y(
        n154) );
  AOI22X1 U189 ( .A(n355), .B(\readDatas<49> ), .C(n356), .D(\readDatas<33> ), 
        .Y(n152) );
  AOI22X1 U190 ( .A(n353), .B(\readDatas<17> ), .C(n354), .D(\readDatas<1> ), 
        .Y(n151) );
  NAND3X1 U191 ( .A(n265), .B(n297), .C(n158), .Y(\read1data<15> ) );
  AOI22X1 U192 ( .A(n3), .B(\readDatas<127> ), .C(n2), .D(\readDatas<111> ), 
        .Y(n160) );
  AOI22X1 U193 ( .A(n5), .B(\readDatas<95> ), .C(n4), .D(\readDatas<79> ), .Y(
        n159) );
  AOI22X1 U194 ( .A(n355), .B(\readDatas<63> ), .C(n356), .D(\readDatas<47> ), 
        .Y(n157) );
  AOI22X1 U195 ( .A(n353), .B(\readDatas<31> ), .C(n354), .D(\readDatas<15> ), 
        .Y(n156) );
  NAND3X1 U196 ( .A(n264), .B(n296), .C(n163), .Y(\read1data<14> ) );
  AOI22X1 U197 ( .A(n3), .B(\readDatas<126> ), .C(n2), .D(\readDatas<110> ), 
        .Y(n165) );
  AOI22X1 U198 ( .A(n5), .B(\readDatas<94> ), .C(n4), .D(\readDatas<78> ), .Y(
        n164) );
  AOI22X1 U199 ( .A(n355), .B(\readDatas<62> ), .C(n356), .D(\readDatas<46> ), 
        .Y(n162) );
  AOI22X1 U200 ( .A(n353), .B(\readDatas<30> ), .C(n354), .D(\readDatas<14> ), 
        .Y(n161) );
  NAND3X1 U201 ( .A(n263), .B(n295), .C(n168), .Y(\read1data<13> ) );
  AOI22X1 U202 ( .A(n3), .B(\readDatas<125> ), .C(n2), .D(\readDatas<109> ), 
        .Y(n170) );
  AOI22X1 U203 ( .A(n5), .B(\readDatas<93> ), .C(n4), .D(\readDatas<77> ), .Y(
        n169) );
  AOI22X1 U204 ( .A(n355), .B(\readDatas<61> ), .C(n356), .D(\readDatas<45> ), 
        .Y(n167) );
  AOI22X1 U205 ( .A(n353), .B(\readDatas<29> ), .C(n354), .D(\readDatas<13> ), 
        .Y(n166) );
  NAND3X1 U206 ( .A(n262), .B(n294), .C(n173), .Y(\read1data<12> ) );
  AOI22X1 U207 ( .A(n3), .B(\readDatas<124> ), .C(n2), .D(\readDatas<108> ), 
        .Y(n175) );
  AOI22X1 U208 ( .A(n5), .B(\readDatas<92> ), .C(n4), .D(\readDatas<76> ), .Y(
        n174) );
  AOI22X1 U209 ( .A(n355), .B(\readDatas<60> ), .C(n356), .D(\readDatas<44> ), 
        .Y(n172) );
  AOI22X1 U210 ( .A(n353), .B(\readDatas<28> ), .C(n354), .D(\readDatas<12> ), 
        .Y(n171) );
  NAND3X1 U211 ( .A(n261), .B(n293), .C(n178), .Y(\read1data<11> ) );
  AOI22X1 U212 ( .A(n3), .B(\readDatas<123> ), .C(n2), .D(\readDatas<107> ), 
        .Y(n180) );
  AOI22X1 U213 ( .A(n5), .B(\readDatas<91> ), .C(n4), .D(\readDatas<75> ), .Y(
        n179) );
  AOI22X1 U214 ( .A(n355), .B(\readDatas<59> ), .C(n356), .D(\readDatas<43> ), 
        .Y(n177) );
  AOI22X1 U215 ( .A(n353), .B(\readDatas<27> ), .C(n354), .D(\readDatas<11> ), 
        .Y(n176) );
  NAND3X1 U216 ( .A(n260), .B(n292), .C(n183), .Y(\read1data<10> ) );
  AOI22X1 U217 ( .A(n3), .B(\readDatas<122> ), .C(n2), .D(\readDatas<106> ), 
        .Y(n185) );
  AOI22X1 U218 ( .A(n5), .B(\readDatas<90> ), .C(n4), .D(\readDatas<74> ), .Y(
        n184) );
  AOI22X1 U219 ( .A(n355), .B(\readDatas<58> ), .C(n356), .D(\readDatas<42> ), 
        .Y(n182) );
  AOI22X1 U220 ( .A(n353), .B(\readDatas<26> ), .C(n354), .D(\readDatas<10> ), 
        .Y(n181) );
  NAND3X1 U221 ( .A(n259), .B(n291), .C(n188), .Y(\read1data<0> ) );
  AOI22X1 U222 ( .A(n3), .B(\readDatas<112> ), .C(n2), .D(\readDatas<96> ), 
        .Y(n190) );
  NAND3X1 U223 ( .A(\read1regsel<1> ), .B(n7), .C(n352), .Y(n191) );
  NAND3X1 U224 ( .A(\read1regsel<1> ), .B(\read1regsel<0> ), .C(n352), .Y(n192) );
  AOI22X1 U225 ( .A(n5), .B(\readDatas<80> ), .C(n4), .D(\readDatas<64> ), .Y(
        n189) );
  NAND3X1 U226 ( .A(n7), .B(n6), .C(n352), .Y(n193) );
  NAND3X1 U227 ( .A(\read1regsel<0> ), .B(n6), .C(n352), .Y(n194) );
  AOI22X1 U228 ( .A(n355), .B(\readDatas<48> ), .C(n356), .D(\readDatas<32> ), 
        .Y(n187) );
  NOR3X1 U229 ( .A(\read1regsel<0> ), .B(n352), .C(n6), .Y(n113) );
  NOR3X1 U230 ( .A(n7), .B(n352), .C(n6), .Y(n112) );
  AOI22X1 U231 ( .A(n353), .B(\readDatas<16> ), .C(n354), .D(\readDatas<0> ), 
        .Y(n186) );
  NOR3X1 U232 ( .A(\read1regsel<1> ), .B(n352), .C(\read1regsel<0> ), .Y(n115)
         );
  NOR3X1 U233 ( .A(\read1regsel<1> ), .B(n352), .C(n7), .Y(n114) );
  BUFX2 U234 ( .A(n25), .Y(n360) );
  BUFX2 U235 ( .A(n27), .Y(n358) );
  BUFX2 U236 ( .A(n113), .Y(n356) );
  BUFX2 U237 ( .A(n115), .Y(n354) );
  INVX1 U238 ( .A(\writeregsel<2> ), .Y(n14) );
  INVX1 U239 ( .A(\writeregsel<0> ), .Y(n16) );
  INVX1 U240 ( .A(\writeregsel<1> ), .Y(n15) );
  BUFX2 U241 ( .A(\writedata<1> ), .Y(n336) );
  BUFX2 U242 ( .A(\writedata<2> ), .Y(n337) );
  BUFX2 U243 ( .A(\writedata<3> ), .Y(n338) );
  BUFX2 U244 ( .A(\writedata<4> ), .Y(n339) );
  BUFX2 U245 ( .A(\writedata<5> ), .Y(n340) );
  BUFX2 U246 ( .A(\writedata<6> ), .Y(n341) );
  BUFX2 U247 ( .A(\writedata<7> ), .Y(n342) );
  BUFX2 U248 ( .A(\writedata<8> ), .Y(n343) );
  BUFX2 U249 ( .A(\writedata<9> ), .Y(n344) );
  BUFX2 U250 ( .A(\writedata<10> ), .Y(n345) );
  BUFX2 U251 ( .A(\writedata<11> ), .Y(n346) );
  BUFX2 U252 ( .A(\writedata<12> ), .Y(n347) );
  BUFX2 U253 ( .A(\writedata<13> ), .Y(n348) );
  BUFX2 U254 ( .A(\writedata<14> ), .Y(n349) );
  BUFX2 U255 ( .A(\writedata<15> ), .Y(n350) );
  BUFX2 U256 ( .A(\writedata<0> ), .Y(n335) );
  INVX2 U257 ( .A(n362), .Y(n361) );
  INVX1 U258 ( .A(rst), .Y(n362) );
  AND2X1 U259 ( .A(n211), .B(n243), .Y(n100) );
  AND2X1 U260 ( .A(n218), .B(n250), .Y(n65) );
  AND2X1 U261 ( .A(n219), .B(n251), .Y(n60) );
  AND2X1 U262 ( .A(n220), .B(n252), .Y(n55) );
  AND2X1 U263 ( .A(n221), .B(n253), .Y(n50) );
  AND2X1 U264 ( .A(n222), .B(n254), .Y(n45) );
  AND2X1 U265 ( .A(n223), .B(n255), .Y(n40) );
  AND2X1 U266 ( .A(n224), .B(n256), .Y(n35) );
  AND2X1 U267 ( .A(n225), .B(n257), .Y(n30) );
  AND2X1 U268 ( .A(n226), .B(n258), .Y(n21) );
  AND2X1 U269 ( .A(n212), .B(n244), .Y(n95) );
  AND2X1 U270 ( .A(n213), .B(n245), .Y(n90) );
  AND2X1 U271 ( .A(n214), .B(n246), .Y(n85) );
  AND2X1 U272 ( .A(n215), .B(n247), .Y(n80) );
  AND2X1 U273 ( .A(n216), .B(n248), .Y(n75) );
  AND2X1 U274 ( .A(n217), .B(n249), .Y(n70) );
  AND2X1 U275 ( .A(n195), .B(n227), .Y(n188) );
  AND2X1 U276 ( .A(n202), .B(n234), .Y(n153) );
  AND2X1 U277 ( .A(n203), .B(n235), .Y(n148) );
  AND2X1 U278 ( .A(n204), .B(n236), .Y(n143) );
  AND2X1 U279 ( .A(n205), .B(n237), .Y(n138) );
  AND2X1 U280 ( .A(n206), .B(n238), .Y(n133) );
  AND2X1 U281 ( .A(n207), .B(n239), .Y(n128) );
  AND2X1 U282 ( .A(n208), .B(n240), .Y(n123) );
  AND2X1 U283 ( .A(n209), .B(n241), .Y(n118) );
  AND2X1 U284 ( .A(n210), .B(n242), .Y(n109) );
  AND2X1 U285 ( .A(n196), .B(n228), .Y(n183) );
  AND2X1 U286 ( .A(n197), .B(n229), .Y(n178) );
  AND2X1 U287 ( .A(n198), .B(n230), .Y(n173) );
  AND2X1 U288 ( .A(n199), .B(n231), .Y(n168) );
  AND2X1 U289 ( .A(n200), .B(n232), .Y(n163) );
  AND2X1 U290 ( .A(n201), .B(n233), .Y(n158) );
  BUFX2 U291 ( .A(n114), .Y(n353) );
  BUFX2 U292 ( .A(n112), .Y(n355) );
  BUFX2 U293 ( .A(n26), .Y(n357) );
  BUFX2 U294 ( .A(n24), .Y(n359) );
  INVX1 U295 ( .A(\read1regsel<1> ), .Y(n6) );
  BUFX2 U296 ( .A(\read1regsel<2> ), .Y(n352) );
  INVX1 U297 ( .A(\read1regsel<0> ), .Y(n7) );
  INVX1 U298 ( .A(\read2regsel<1> ), .Y(n12) );
  BUFX2 U299 ( .A(\read2regsel<2> ), .Y(n351) );
  INVX1 U300 ( .A(\read2regsel<0> ), .Y(n13) );
  BUFX2 U301 ( .A(n189), .Y(n195) );
  BUFX2 U302 ( .A(n184), .Y(n196) );
  BUFX2 U303 ( .A(n179), .Y(n197) );
  BUFX2 U304 ( .A(n174), .Y(n198) );
  BUFX2 U305 ( .A(n169), .Y(n199) );
  BUFX2 U306 ( .A(n164), .Y(n200) );
  BUFX2 U307 ( .A(n159), .Y(n201) );
  BUFX2 U308 ( .A(n154), .Y(n202) );
  BUFX2 U309 ( .A(n149), .Y(n203) );
  BUFX2 U310 ( .A(n144), .Y(n204) );
  BUFX2 U311 ( .A(n139), .Y(n205) );
  BUFX2 U312 ( .A(n134), .Y(n206) );
  BUFX2 U313 ( .A(n129), .Y(n207) );
  BUFX2 U314 ( .A(n124), .Y(n208) );
  BUFX2 U315 ( .A(n119), .Y(n209) );
  BUFX2 U316 ( .A(n110), .Y(n210) );
  BUFX2 U317 ( .A(n101), .Y(n211) );
  BUFX2 U318 ( .A(n96), .Y(n212) );
  BUFX2 U319 ( .A(n91), .Y(n213) );
  BUFX2 U320 ( .A(n86), .Y(n214) );
  BUFX2 U321 ( .A(n81), .Y(n215) );
  BUFX2 U322 ( .A(n76), .Y(n216) );
  BUFX2 U323 ( .A(n71), .Y(n217) );
  BUFX2 U324 ( .A(n66), .Y(n218) );
  BUFX2 U325 ( .A(n61), .Y(n219) );
  BUFX2 U326 ( .A(n56), .Y(n220) );
  BUFX2 U327 ( .A(n51), .Y(n221) );
  BUFX2 U328 ( .A(n46), .Y(n222) );
  BUFX2 U329 ( .A(n41), .Y(n223) );
  BUFX2 U330 ( .A(n36), .Y(n224) );
  BUFX2 U331 ( .A(n31), .Y(n225) );
  BUFX2 U332 ( .A(n22), .Y(n226) );
  BUFX2 U333 ( .A(n190), .Y(n227) );
  BUFX2 U334 ( .A(n185), .Y(n228) );
  BUFX2 U335 ( .A(n180), .Y(n229) );
  BUFX2 U336 ( .A(n175), .Y(n230) );
  BUFX2 U337 ( .A(n170), .Y(n231) );
  BUFX2 U338 ( .A(n165), .Y(n232) );
  BUFX2 U339 ( .A(n160), .Y(n233) );
  BUFX2 U340 ( .A(n155), .Y(n234) );
  BUFX2 U341 ( .A(n150), .Y(n235) );
  BUFX2 U342 ( .A(n145), .Y(n236) );
  BUFX2 U343 ( .A(n140), .Y(n237) );
  BUFX2 U344 ( .A(n135), .Y(n238) );
  BUFX2 U345 ( .A(n130), .Y(n239) );
  BUFX2 U346 ( .A(n125), .Y(n240) );
  BUFX2 U347 ( .A(n120), .Y(n241) );
  BUFX2 U348 ( .A(n111), .Y(n242) );
  BUFX2 U349 ( .A(n102), .Y(n243) );
  BUFX2 U350 ( .A(n97), .Y(n244) );
  BUFX2 U351 ( .A(n92), .Y(n245) );
  BUFX2 U352 ( .A(n87), .Y(n246) );
  BUFX2 U353 ( .A(n82), .Y(n247) );
  BUFX2 U354 ( .A(n77), .Y(n248) );
  BUFX2 U355 ( .A(n72), .Y(n249) );
  BUFX2 U356 ( .A(n67), .Y(n250) );
  BUFX2 U357 ( .A(n62), .Y(n251) );
  BUFX2 U358 ( .A(n57), .Y(n252) );
  BUFX2 U359 ( .A(n52), .Y(n253) );
  BUFX2 U360 ( .A(n47), .Y(n254) );
  BUFX2 U361 ( .A(n42), .Y(n255) );
  BUFX2 U362 ( .A(n37), .Y(n256) );
  BUFX2 U363 ( .A(n32), .Y(n257) );
  BUFX2 U364 ( .A(n23), .Y(n258) );
  BUFX2 U365 ( .A(n186), .Y(n259) );
  BUFX2 U366 ( .A(n181), .Y(n260) );
  BUFX2 U367 ( .A(n176), .Y(n261) );
  BUFX2 U368 ( .A(n171), .Y(n262) );
  BUFX2 U369 ( .A(n166), .Y(n263) );
  BUFX2 U370 ( .A(n161), .Y(n264) );
  BUFX2 U371 ( .A(n156), .Y(n265) );
  BUFX2 U372 ( .A(n151), .Y(n266) );
  BUFX2 U373 ( .A(n146), .Y(n267) );
  BUFX2 U374 ( .A(n141), .Y(n268) );
  BUFX2 U375 ( .A(n136), .Y(n269) );
  BUFX2 U376 ( .A(n131), .Y(n270) );
  BUFX2 U377 ( .A(n126), .Y(n271) );
  BUFX2 U378 ( .A(n121), .Y(n272) );
  BUFX2 U379 ( .A(n116), .Y(n273) );
  BUFX2 U380 ( .A(n107), .Y(n274) );
  BUFX2 U381 ( .A(n98), .Y(n275) );
  BUFX2 U382 ( .A(n93), .Y(n276) );
  BUFX2 U383 ( .A(n88), .Y(n277) );
  BUFX2 U384 ( .A(n83), .Y(n278) );
  BUFX2 U385 ( .A(n78), .Y(n279) );
  BUFX2 U386 ( .A(n73), .Y(n280) );
  BUFX2 U387 ( .A(n68), .Y(n281) );
  BUFX2 U388 ( .A(n63), .Y(n282) );
  BUFX2 U389 ( .A(n58), .Y(n283) );
  BUFX2 U390 ( .A(n53), .Y(n284) );
  BUFX2 U391 ( .A(n48), .Y(n285) );
  BUFX2 U392 ( .A(n43), .Y(n286) );
  BUFX2 U393 ( .A(n38), .Y(n287) );
  BUFX2 U394 ( .A(n33), .Y(n288) );
  BUFX2 U395 ( .A(n28), .Y(n289) );
  BUFX2 U396 ( .A(n19), .Y(n290) );
  BUFX2 U397 ( .A(n187), .Y(n291) );
  BUFX2 U398 ( .A(n182), .Y(n292) );
  BUFX2 U399 ( .A(n177), .Y(n293) );
  BUFX2 U400 ( .A(n172), .Y(n294) );
  BUFX2 U401 ( .A(n167), .Y(n295) );
  BUFX2 U402 ( .A(n162), .Y(n296) );
  BUFX2 U403 ( .A(n157), .Y(n297) );
  BUFX2 U404 ( .A(n152), .Y(n298) );
  BUFX2 U405 ( .A(n147), .Y(n299) );
  BUFX2 U406 ( .A(n142), .Y(n300) );
  BUFX2 U407 ( .A(n137), .Y(n301) );
  BUFX2 U408 ( .A(n132), .Y(n302) );
  BUFX2 U409 ( .A(n127), .Y(n303) );
  BUFX2 U410 ( .A(n122), .Y(n304) );
  BUFX2 U411 ( .A(n117), .Y(n305) );
  BUFX2 U412 ( .A(n108), .Y(n306) );
  BUFX2 U413 ( .A(n99), .Y(n307) );
  BUFX2 U414 ( .A(n94), .Y(n308) );
  BUFX2 U415 ( .A(n89), .Y(n309) );
  BUFX2 U416 ( .A(n84), .Y(n310) );
  BUFX2 U417 ( .A(n79), .Y(n311) );
  BUFX2 U418 ( .A(n74), .Y(n312) );
  BUFX2 U419 ( .A(n69), .Y(n313) );
  BUFX2 U420 ( .A(n64), .Y(n314) );
  BUFX2 U421 ( .A(n59), .Y(n315) );
  BUFX2 U422 ( .A(n54), .Y(n316) );
  BUFX2 U423 ( .A(n49), .Y(n317) );
  BUFX2 U424 ( .A(n44), .Y(n318) );
  BUFX2 U425 ( .A(n39), .Y(n319) );
  BUFX2 U426 ( .A(n34), .Y(n320) );
  BUFX2 U427 ( .A(n29), .Y(n321) );
  BUFX2 U428 ( .A(n20), .Y(n322) );
  BUFX2 U429 ( .A(n194), .Y(n323) );
  INVX1 U430 ( .A(n323), .Y(n5) );
  BUFX2 U431 ( .A(n193), .Y(n324) );
  INVX1 U432 ( .A(n324), .Y(n4) );
  BUFX2 U433 ( .A(n192), .Y(n325) );
  INVX1 U434 ( .A(n325), .Y(n3) );
  BUFX2 U435 ( .A(n191), .Y(n326) );
  INVX1 U436 ( .A(n326), .Y(n2) );
  BUFX2 U437 ( .A(n106), .Y(n327) );
  INVX1 U438 ( .A(n327), .Y(n11) );
  BUFX2 U439 ( .A(n105), .Y(n328) );
  INVX1 U440 ( .A(n328), .Y(n10) );
  BUFX2 U441 ( .A(n104), .Y(n329) );
  INVX1 U442 ( .A(n329), .Y(n9) );
  BUFX2 U443 ( .A(n103), .Y(n330) );
  INVX1 U444 ( .A(n330), .Y(n8) );
  AND2X1 U445 ( .A(write), .B(n14), .Y(n331) );
  INVX1 U446 ( .A(n331), .Y(n332) );
  AND2X1 U447 ( .A(\writeregsel<2> ), .B(write), .Y(n333) );
  INVX1 U448 ( .A(n333), .Y(n334) );
endmodule


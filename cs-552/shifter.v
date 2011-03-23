module shifter (In, Cnt, Op, Out);
   input [15:0] In;
   input [3:0]  Cnt;
   input [1:0]  Op;
   output [15:0] Out;
   wire [15:0] 	 oneTwo, twoFour, fourEight, eightOut;

   shifter1 s1 (In, Op, Cnt[0], oneTwo);
   shifter2 s2 (oneTwo, Op, Cnt[1], twoFour);
   shifter4 s4 (twoFour, Op, Cnt[2], fourEight);
   shifter8 s8 (fourEight, Op, Cnt[3], eightOut);
   assign Out = eightOut;
endmodule


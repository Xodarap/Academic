module fourbitfull(A, B, Cin, S, G, P, Cout);
   input [3:0] A, B;
   input       Cin;
   output [3:0] S;
   output 	G, P, Cout;

   fourbitlookahead a1(A, B, G, P);
   assign Cout = G | (P & Cin);
   fourbitripple a2(A, B, Cin, S);
endmodule   
   
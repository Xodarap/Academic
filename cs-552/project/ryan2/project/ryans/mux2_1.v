//Ryan Peeters
//ECE 552

module mux2_1( InA, InB, S, Out);
    
input InA, InB, S;
output Out;
wire n3_in1, n3_in2, s_n;
not1 not_s(.in1(S), .out(s_n));
nand2 nand_1(.in1(InA), .in2(s_n), .out(n3_in1));
nand2 nand_2(.in1(InB), .in2(S), .out(n3_in2));
nand2 nand_3(.in1(n3_in1), .in2(n3_in2), .out(Out));
    
endmodule
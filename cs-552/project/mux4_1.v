//Ryan Peeters
//ECE 552

module mux4_1(InA, InB, InC, InD, S, Out);
    
    input InA, InB, InC, InD;
    input [1:0] S;
    output Out;
    wire mux3_in1, mux3_in2;
    mux2_1 mux1(.InA(InA), .InB(InB), .S(S[0]), .Out(mux3_in1));
    mux2_1 mux2(.InA(InC), .InB(InD), .S(S[0]), .Out(mux3_in2));
    mux2_1 mux3(.InA(mux3_in1), .InB(mux3_in2), .S(S[1]), .Out(Out));
    
endmodule

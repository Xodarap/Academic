//Ryan Peeters
//ECE 552

module mux4b2_1(InA, InB, S, Out);
    
    input [3:0] InA, InB;
    input S;
    output [3:0] Out;
    
    mux2_1 mux0(.InA(InA[0]), .InB(InB[0]),
                    .S(S), .Out(Out[0]));
    mux2_1 mux1(.InA(InA[1]), .InB(InB[1]),
                    .S(S), .Out(Out[1]));
    mux2_1 mux2(.InA(InA[2]), .InB(InB[2]), 
                    .S(S), .Out(Out[2]));
    mux2_1 mux3(.InA(InA[3]), .InB(InB[3]), 
                    .S(S), .Out(Out[3]));
    
endmodule

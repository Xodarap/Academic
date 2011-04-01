//Ryan Peeters
//ECE 552

module mux16b2_1(InA, InB, S, Out);
    
    input [15:0] InA, InB;
    input S;
    output [15:0] Out;
    
    mux4b2_1 mux0(.InA(InA[3:0]), .InB(InB[3:0]),
                    .S(S), .Out(Out[3:0]));
    mux4b2_1 mux1(.InA(InA[7:4]), .InB(InB[7:4]),
                    .S(S), .Out(Out[7:4]));
    mux4b2_1 mux2(.InA(InA[11:8]), .InB(InB[11:8]),
                    .S(S), .Out(Out[11:8]));
    mux4b2_1 mux3(.InA(InA[15:12]), .InB(InB[15:12]),
                    .S(S), .Out(Out[15:12]));
    
endmodule


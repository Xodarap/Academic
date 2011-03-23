//Ryan Peeters
//ECE 552

module fulladder4(A, B, CI, SUM, CO);

    input [3:0]A, B;
    input CI;
    output [3:0]SUM;
    output CO;
    wire c1, c2, c3;
    
    fulladder1 add0(.A(A[0]), .B(B[0]), .Cin(CI), .S(SUM[0]), .Cout(c1));
    fulladder1 add1(.A(A[1]), .B(B[1]), .Cin(c1), .S(SUM[1]), .Cout(c2));
    fulladder1 add2(.A(A[2]), .B(B[2]), .Cin(c2), .S(SUM[2]), .Cout(c3));
    fulladder1 add3(.A(A[3]), .B(B[3]), .Cin(c3), .S(SUM[3]), .Cout(CO));
            
endmodule

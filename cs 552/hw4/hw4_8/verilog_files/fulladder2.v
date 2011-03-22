//Ryan Peeters
//ECE 552

module fulladder2(A, B, SUM);

    input [1:0]A, B;
    output [1:0]SUM;
    wire c1, c2;
    
    fulladder1 add0(.A(A[0]), .B(B[0]), .Cin(1'b0), .S(SUM[0]), .Cout(c1));
    fulladder1 add1(.A(A[1]), .B(B[1]), .Cin(c1), .S(SUM[1]), .Cout(c2));
            
endmodule
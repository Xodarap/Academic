//Ryan Peeters
//ECE 552, Cout

module fulladder1( A, B, Cin, S, Cout);
  
    input A, B, Cin;
    output S, Cout;
    wire x1_out, n1_out, n2_out;  //wires between gates
    
    xor2 x1(.in1(A), .in2(B), .out(x1_out));
    xor2 x2(.in1(x1_out), .in2(Cin), .out(S));
    nand2 n3(.in1(n2_out), .in2(n1_out), .out(Cout));
    nand2 n1(.in1(A), .in2(B), .out(n1_out));
    nand2 n2(.in1(x1_out), .in2(Cin), .out(n2_out));
    
endmodule

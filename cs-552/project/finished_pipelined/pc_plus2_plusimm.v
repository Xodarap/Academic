//Ryan Peeters
//ECE 552

module pc_plus2_plusimm(pc, imm, branchAddr);
	input [15:0] pc, imm;
	output [15:0] branchAddr;

	wire [15:0] between;
	wire foo1, foo2, foo3, foo4, foo5, foo6, foo7, foo8;
	cla16b add1(.A(pc), .B(16'd2), .Cin(1'b0), .Sum(between), .Cout(foo1), 
			.PG(foo2), .GG(foo3), .CintoMSB(foo4));
	
	cla16b add2(.A(between), .B(imm), .Cin(1'b0), .Sum(branchAddr), .Cout(foo1), 
			.PG(foo2), .GG(foo3), .CintoMSB(foo4));


endmodule

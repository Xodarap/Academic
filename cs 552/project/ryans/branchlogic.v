//Ryan Peeters
//ECE 552

module branchlogic(branchCode, A, Out);
	input [1:0] branchCode;
	input [15:0] A;
	output reg Out;
	wire zero;
	
	assign zero = (|A) ? 1'b0: 1'b1;		//zero = 0 iff A = 16'b0
	
	always @(*)begin
		case(branchCode)
			2'b00: Out = zero;					//EQZ
			2'b01: Out = ~zero;					//NEZ
			2'b10: Out = (A[15]) ? 1'b1: 1'b0;	//LTZ
			2'b11: Out = (~A[15]) ? 1'b1: 1'b0;	//GEZ
		endcase
	end
endmodule
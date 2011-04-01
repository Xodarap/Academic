//Ryan Peeters
//ECE 552

module branchlogic(branchCode, A, Out);
	input [2:0] branchCode;
	input [15:0] A;
	output Out;
	reg    OutTemp;
   
	wire zero;
	
	assign zero = (|A) ? 1'b0: 1'b1;		//zero = 0 iff A = 16'b0
	
	always @(*)begin
		casex(branchCode)
			3'b100: OutTemp = zero;				//EQZ
			3'b101: OutTemp = ~zero;			//NEZ
			3'b110: OutTemp = (A[15]) ? 1'b1: 1'b0;		//LTZ
			3'b111: OutTemp = (~A[15]) ? 1'b1: 1'b0;	//GEZ
			3'b0xx: OutTemp = 1'b0;
		endcase
	end

   assign Out = OutTemp;
   
endmodule

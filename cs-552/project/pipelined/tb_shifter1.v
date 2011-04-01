module tb_shifter1;
	reg [15:0] In;
	wire [15:0] Out;
	reg [1:0] Op;
	reg [5:0] iter;
	reg [2:0] opIter;
	reg clk;

	shifter4 s1(.Out (Out[15:0]), .In (In[15:0]), .Op (Op[1:0]));
	initial begin
		Op = 2'b00;
		In = 16'b1000000000000001;
		clk = 0;
		for(opIter = 0; opIter < 4; opIter = opIter+1) begin
			Op = Op + 1;
			for(iter=0; iter<4; iter=iter+1) begin
				In = In + 1;
				#100 clk = 0;
				#100 clk = 1;
				#100;
			end
		end
	end

	always @(posedge clk) begin
	   $display("In: %b, Op: %d, Out: %b", In, Op, Out);
	end
endmodule

module t_memory2writeback;

	reg clk, rst, regwritein, memtoregin;
	reg [15:0] aluresultin, readdatain, instrin;
	wire [15:0] aluresultout, readdataout, instrout;
	reg [2:0] destregin;
	wire [2:0] destregout;
	wire regwriteout, memtoregout;


	memory2writeback m2wb(.Clk(clk), .Rst(rst), 
			.RegWriteIn(regwritein), .ReadDataIn(readdatain), 
			.ALUResultIn(aluresultin), .DestRegIn(destregin),
			.MemToRegIn(memtoregin), .MemToRegOut(memtoregout),
			.RegWriteOut(regwriteout), .ReadDataOut(readdataout),
			.ALUResultOut(aluresultout), .DestRegOut(destregout),
			.InstructionIn(instrin), .InstructionOut(instrout));


	always @(clk) begin
		#5 clk <= ~clk;
	end

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		instrin = 16'hfedc;
		memtoregin = 1'b0;
		regwritein = 1'b1;
		aluresultin = 16'hbeef;
		readdatain = 16'habcd;
		destregin = 3'b010;
		#20;
		rst = 1'b0;
		#10;
		regwritein = 1'b0;
		aluresultin = 16'h1122;
		readdatain = 16'h2233;
		destregin = 3'b100;
		instrin = 16'h1357;
		#16;
		memtoregin = 1'b1;
		regwritein = 1'b1;
		aluresultin = 16'h3344;
		readdatain = 16'h7878;
		destregin = 3'b000;
		#20;
	end
endmodule

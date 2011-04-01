module memory(Clk, Rst, Addr, Data, MemWrite, MemRead, ReadData);
   input Clk, Rst;
   input [15:0] Addr, Data;
   input 	MemWrite, MemRead;
   output [15:0] ReadData;
   wire [15:0] 	 readTemp;
   
   
   memory2csyn memory0(.data_out(readTemp), 
		    .data_in(Data), 
		    .addr(Addr), 
		    .enable(1'b1), 
		    .wr(MemWrite), 
		    .createdump(1'b0), 
		    .clk(Clk), 
		    .rst(Rst));
   assign ReadData = readTemp & {16{MemRead}};
endmodule // memory

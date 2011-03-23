/* $Author: karu $ */
/* $LastChangedDate: 2009-02-22 23:48:33 -0600 (Sun, 22 Feb 2009) $ */
/* $Rev: 20 $ */

module tb_memory(/*AUTOARG*/);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [15:0]          read1data;              // From top of rf_hier.v
   wire [15:0]          read2data;              // From top of rf_hier.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [2:0]            read1regsel;            // To top of rf_hier.v
   reg [2:0]            read2regsel;            // To top of rf_hier.v
   reg                  write;                  // To top of rf_hier.v
   reg [15:0]           writedata;              // To top of rf_hier.v
   reg [2:0]            writeregsel;            // To top of rf_hier.v
   reg [7:0] 		imm;
   reg [10:0] 		address;
   
   // End of automatics

   integer              cycle_count;

   wire                 clk;
   wire                 rst, err;

   wire [15:0] 		immExt, addrExt;
   
   clkrst clk0(.clk (clk), .rst (rst), .err(err));
   // Instantiate the module we want to verify   
   // Memory is byte-addressable, so multiply each address by 2 to get
   // an actually unique value
   memory DUT(.Clk(clk), .Rst(rst), .Addr(2 * writeregsel), .Data(writedata), .MemWrite(write),
	      .MemRead(1), .ReadData(read1data));
   
   // ref_rf is our reference register file
   reg [15:0]           ref_rf[7:0];
   reg [15:0]           ref_r1data;
   reg [15:0]           ref_r2data;
   
   initial begin
      cycle_count = 0;
      ref_rf[0] = 0;
      ref_rf[1] = 0;
      ref_rf[2] = 0;
      ref_rf[3] = 0;
      ref_rf[4] = 0;
      ref_rf[5] = 0;
      ref_rf[6] = 0;
      ref_rf[7] = 0;
      ref_r1data = 0;
      ref_r2data = 0;
      write = 0;
      $dumpvars;
      $display("Simulation 1000 cycles");
      
   end
   
   always @ (posedge clk)begin
       
      // create 2 random read ports
   
      // create random data
      writedata = $random % 65536;
      
       // create a r
      // andom write port
      writeregsel = $random % 8;
      
      // randomly choose whether to write or not
      write = $random % 2;
      
      // Read values from reference model
      ref_r1data = ref_rf[ writeregsel ];
      ref_r2data = ref_rf[ read2regsel ];
      
      // Reference model. We compare simulation against this
      // Write data into reference model
      if ((cycle_count >= 2) && write) begin
         ref_rf[ writeregsel ] = writedata;
      end
      #10;
      
      // Print log of what transpired
      if(write) begin
	 $display("Rd: %d Data: %d", 
               writeregsel,  writedata);
      end
      else begin
	 
	 $display("R1: %d Sim: %d Exp: %d",
               writeregsel, read1data, ref_r1data );
      end

      
      if ( (!write) && !rst && (ref_r1data != read1data) ) begin
         $display("ERROR reading from R%d", writeregsel);
	 $display("Err: %d", err);
	 
	 //$display("5: %d", DUT.reg0.rf0.rf0.readDatas[5]);
      end
 
      if ( !rst && (read1regsel == writeregsel) && (write) ) begin
         $display("Eventlog: Read/write of same port");
      end 
           
      cycle_count = cycle_count + 1;
      if (cycle_count > 50) begin
         $finish;
      end
   end
endmodule // rf_bench
// DUMMY LINE FOR REV CONTROL :0:

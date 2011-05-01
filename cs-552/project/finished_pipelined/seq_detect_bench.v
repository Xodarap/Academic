/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */

module seq_detect_bench(/*AUTOARG*/);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 match;                  // From DUT of seq_detect_hier.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg                  in;                     // To DUT of seq_detect_hier.v
   // End of automatics

   integer              cycle_count;

   wire                 clk;
   wire                 rst;

   // Instantiate the module we want to verify   

   seq_detect_hier DUT(/*AUTOINST*/
                       // Outputs
                       .match           (match),
                       // Inputs
                       .in              (in));
               
   // Pull out clk and rst from clkgenerator module
   assign               clk = DUT.clk_generator.clk;
   assign               rst = DUT.clk_generator.rst;           

   initial begin
      cycle_count = 0;
      $dumpvars;
      $display("Simulating 5 cycles");
   end
   
   always @ (posedge clk)begin

      $display("Cycle: %d", cycle_count);
      // Delay for simulation to occur
      #10
           
      cycle_count = cycle_count + 1;
      if (cycle_count > 5) begin
         $finish;
         
      end
   end
   
endmodule
// DUMMY LINE FOR REV CONTROL :1:

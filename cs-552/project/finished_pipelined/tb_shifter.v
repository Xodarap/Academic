module tb_shifter(/*AUTOARG*/);


   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [3:0]            Cnt;                    // To s0 of shifter.v
   reg [15:0]           In;                     // To s0 of shifter.v
   reg [1:0]            Op;                     // To s0 of shifter.v
   reg                  err;                    // To c0 of clkrst.v
   // End of automatics
   integer              cycle_count;

   wire [15:0]          Out;
                
   wire                 clk;
   wire                 rst;


   clkrst c0(/*AUTOINST*/
             // Outputs
             .clk                       (clk),
             .rst                       (rst),
             // Inputs
             .err                       (err));

   shifter s0(/*AUTOINST*/
              // Outputs
              .Out                      (Out[15:0]),
              // Inputs
              .In                       (In[15:0]),
              .Cnt                      (Cnt[3:0]),
              .Op                       (Op[1:0]));

   initial begin
      cycle_count = 0;
      In = 16'b1000000100110000;
      Cnt = 4'b1000;
      Op = 2'b10;
      $dumpvars;
      $display("Simulating 10 cycles");
   end

   always @(posedge clk) begin
      $display("Cycle %d", c0.cycle_count);

      In = In + 1;
      #3;
      $display("In: %b, Cnt: %d, Out: %b\n",
               In, Cnt, Out);
      
      if (c0.cycle_count > 10) begin
         $finish;
         
      end

   end
   
endmodule // tb_shifter

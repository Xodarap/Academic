//Ryan Peeters
//ECE 552

module shifter (In, Cnt, Op, Out);
   
   input [15:0] In;
   input [3:0]  Cnt;
   input [1:0]  Op;
   output [15:0] Out;

   wire [15:0] S0, S1, S2;  //output of each state of the shift
   //inputs for the muxes at each stage
   wire [15:0] mux4a_in1, mux4a_in2, mux4a_in3, mux4a_in4, mux4a_out;
   wire [15:0] mux4b_in1, mux4b_in2, mux4b_in3, mux4b_in4, mux4b_out;
   wire [15:0] mux4c_in1, mux4c_in2, mux4c_in3, mux4c_in4, mux4c_out;
   wire [15:0] mux4d_in1, mux4d_in2, mux4d_in3, mux4d_in4, mux4d_out;
   
 //STAGE 0 (a)
   //assign mux inputs for the 4 different operations
   assign mux4a_in1 = {In[14:0], In[15]};
   assign mux4a_in2 = {In[14:0], 1'b0};
   assign mux4a_in3 = {In[0], In[15:1]};                   
   assign mux4a_in4 = {1'b0, In[15:1]};
   
   //select operation based on Op  
   mux16b4_1 muxa(.InA(mux4a_in1), .InB(mux4a_in2), .InC(mux4a_in3),
                    .InD(mux4a_in4), .S(Op), .Out(mux4a_out));
   //select whether to apply operation or not based on Cnt                   
   mux16b2_1 muxa2(.InA(In[15:0]), .InB(mux4a_out[15:0]), .S(Cnt[0]),
                    .Out(S0));      
   
//STAGE 1 (b)
   //assign mux inputs for the 4 different operations                 
   assign mux4b_in1 = {S0[13:0], S0[15:14]};
   assign mux4b_in2 = {S0[13:0], 2'b00};
   assign mux4b_in3 = {S0[1:0], S0[15:2]};                   
   assign mux4b_in4 = {2'b00, S0[15:2]}; 
   //select operation based on Op           
   mux16b4_1 muxb(.InA(mux4b_in1), .InB(mux4b_in2), .InC(mux4b_in3),
                    .InD(mux4b_in4), .S(Op), .Out(mux4b_out));
   //select whether to apply operation or not based on Cnt                 
   mux16b2_1 muxb2(.InA(S0[15:0]), .InB(mux4b_out[15:0]), .S(Cnt[1]),
                    .Out(S1));
   
//STAGE 2 (c)  
   //assign mux inputs for the 4 different operations               
   assign mux4c_in1 = {S1[11:0], S1[15:12]};	//ROL	00
   assign mux4c_in2 = {S1[11:0], 4'b0000};		//LSL	01
   assign mux4c_in3 = {S1[3:0], S1[15:4]};      //ROR   10     
   assign mux4c_in4 = {4'b0000, S1[15:4]};  	//LSR	11
   //select operation based on Op         
   mux16b4_1 muxc(.InA(mux4c_in1), .InB(mux4c_in2), .InC(mux4c_in3),
                    .InD(mux4c_in4), .S(Op), .Out(mux4c_out));
   //select whether to apply operation or not based on Cnt                 
   mux16b2_1 muxc2(.InA(S1[15:0]), .InB(mux4c_out[15:0]), .S(Cnt[2]),
                    .Out(S2)); 
   
//STAGE 3 (d) 
   //assign mux inputs for the 4 different operations               
   assign mux4d_in1 = {S2[7:0], S2[15:8]};
   assign mux4d_in2 = {S2[7:0], 8'b0000_0000};
   assign mux4d_in3 = {S2[7:0], S2[15:8]};                   
   assign mux4d_in4 = {8'b0000_0000, S2[15:8]};
   //select operation based on Op        
   mux16b4_1 muxd(.InA(mux4d_in1), .InB(mux4d_in2), .InC(mux4d_in3),
                    .InD(mux4d_in4), .S(Op), .Out(mux4d_out));
   //select whether to apply operation or not based on Cnt                 
   mux16b2_1 muxd2(.InA(S2[15:0]), .InB(mux4d_out[15:0]), .S(Cnt[3]),
                    .Out(Out));                                 
                                 
endmodule


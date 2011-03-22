
module counter5(push, pop, rst, clk, currentState);
input push, pop, rst, clk;
output [3:0] currentState;

wire [3:0] nextState, moveAmount, tempNext;
reg [3:0] nextReg;

onebitreg state[3:0](.readdata(currentState), .clk(clk), .rst(rst), .writedata(nextState), .write(1'b1));

assign moveAmount = push - pop;
assign tempNext = currentState + moveAmount;
always @* casex ({currentState == 4'b0, currentState == 4'b0100, moveAmount == 4'b0001, moveAmount == -4'b0001, rst})
         5'b????1: nextReg = 4'b0000;
         5'b1??1?: nextReg = 0;
         5'b?11??: nextReg = 4;
         5'b?????: nextReg = tempNext;        
endcase
assign nextState = nextReg;
endmodule
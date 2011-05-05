//Pipelined processor test
//Ryan Peeters and Ben West

lbi r1, 0x0		//0: r1 <- 0
lbi r1, 0x6		//1: r1 <- 6
st r1, r1, 10		//2: mem[10] <- 6
ld r2, r1, 10		//3: r2 <- 6 from mem[10]
st r2, r1, 10		//4: mem[10] <- 6
ld r3, r1, 10		//5: r3 <- 6 from mem[10]
sle r4, r3, r1		//6: r4 <- 1
bgez r4, 4		//7: branch taken
halt
nop
lbi r4, 0x0		//8: r4 <- 0
beqz r4, 2		//9: branch taken
halt			//14: halt
bltz r4, 10		//10: branch not taken
jal 10			//11: r7 <- 0x1e
halt
halt
halt
lbi r3, 7
lbi r4, 7
lbi r5, 1		//12: r5 <- 1
jr r7, 0		//13: return
ld r2, r1, 7

lbi r1, 0x0
lbi r2, 0x5
lbi r3, 0x8
addi r4, r1, 0x1
addi r5, r2, 0x5
addi r6, r3, 0x8
bltz r2, 4		//not taken
beqz r2, 4		//not taken
bgez r2, 4		//taken
addi r7, r4, 0x5	//skipped
add  r1, r4, r5		//skipped
sub  r2, r5, r4		//executed
slt  r3, r5, r6		//executed
halt			//done

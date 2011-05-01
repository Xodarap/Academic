// This is the same as dot.asm, but with the instructions reordered for fewer conflicts
//
// This is indended to be like a dot product, but we don't have a multiplication instruction.
// So it is the sum of the difference of the vectors (i.e. instead of a[i] * b[i] we have
// a[i] - b[i]).
//
// Because we're reusing the registers, forwarding is very important.
// Additionally, since each entry is only one word, loading a long cache line
// will help.
//
// This program is optimized for predict not taken
//
// In pseudocode:
//
// for i = 1 to max:
// 	accum += a[i] - b[i]

lbi  r0, 0  // r0 = i
slbi r0, 0
lbi  r1, 0  // r1 = max
slbi r1, 64
lbi  r2, 0  // r2 = accum
slbi r2, 0
lbi  r3, 0  // r3 = addr of a[i]
slbi r3, 0
lbi  r4, 64 // r4 = addr of b[i]
slbi r4, 0
.loop:
	ld   r5, r3, 0 
	ld   r6, r4, 0 
	addi r0, r0, 1
	addi r3, r3, 16
	addi r4, r4, 16
	sub  r5, r5, r6
	sub  r6, r0, r1
	add  r2, r2, r5  
	beqz r6, .end    
	j    .loop
.end:
	halt

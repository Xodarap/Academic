// This is similar to array.asm, except the branches are usually *not* taken
//
// In pseudocode:
//	
// for i = 1 to max
//    arr[i] = foo
// for i = 1 to max
//    foo = arr[i]
//
// An ideal cache will have no misses in the second loop
// By changing the size of each element in the array (r4) we can make a
// pathological case in which all the elements have the same tag but
// a different index
	
lbi  r0, 0   // r0 = current offset
slbi r0, 0
lbi  r1, 0   // r1 = counter
slbi r1, 0
lbi  r2, 0   // r2 = max
slbi r2, 64
lbi  r4, 64  // r4 = increment amount
slbi r4, 0
.writeLoop:
	sub  r3, r2, r1
	beqz r3, .writeDone
	st   r3, r0, 0
	addi r1, r1, 1
	add  r0, r0, r4
	j    .writeLoop
.writeDone:	
	lbi r1, 0	
	slbi r1, 0
.readLoop:
	beqz r3, .readDone
	ld   r3, r0, 0
	addi r1, r1, 1
	add  r0, r0, r4
	sub  r3, r2, r1
	j .readLoop
.readDone:
	halt
	

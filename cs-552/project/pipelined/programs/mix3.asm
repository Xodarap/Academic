//check forwarding


lbi r1, 0x0
lbi r2, 0x5
lbi r3, 0x8
addi r4, r1, 0x1
addi r5, r4, 0x5
addi r6, r5, 0x8
addi r7, r4, 0x5
add  r1, r7, r6
sub  r2, r1, r1
slt  r3, r2
halt

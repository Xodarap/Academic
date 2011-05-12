//Ryan Peeters
//both operands positive
//78 - 33 = 45
//33 - 78 = -45
//expected r3 = 45
//expected r4 = -45

lbi r1, 78
lbi r2, 33
sub r3, r1, r2
sub r4, r2, r1
halt
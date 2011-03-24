//Ryan Peeters
//one operand zero, one nonzero
//12 - 0 = 12
//0 - 12 = -12
//expected r3 = 12
//expected r4 = -12

lbi r1, 12
lbi r2, 0
sub r3, r1, r2
sub r4, r2, r1
halt
//Ryan Peeters
//both operands negative
//-40 - -75 = 35
//-75 - -40 = -35
//expected r3 = 35
//expected r4 = -35

lbi r1, -40
lbi r2, -75
sub r3, r1, r2
sub r4, r2, r1
halt
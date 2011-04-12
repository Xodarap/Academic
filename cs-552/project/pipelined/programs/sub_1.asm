//Ryan Peeters
//both operands and destination are same register
//56 - 56 = 0
//expected r1 = 0

lbi r1, 56
sub r1, r1, r1
halt
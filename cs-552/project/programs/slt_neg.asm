lbi r1, 0x9a
slbi r1, 0xff	
lbi r2, 0x78
slbi r2, 0x88
sub r3, r1, r2
sub r3, r2, r1	
slt r3, r1,r2
halt	

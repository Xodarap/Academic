// Original test: ./freiberg/hw4/problem6/stu_1.asm
// Author: freiberg
// Test source code follows


//high corner case
lbi r1, 254
lbi r2, 5
stu r2, r1, 31
ld r2, r1, 0
halt

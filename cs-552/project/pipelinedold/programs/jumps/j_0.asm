// Original test: ./neel/hw4/problem6/j_0.asm
// Author: neel
// Test source code follows


//Tests j  with negative offset

lbi r1,255		//1
j 4			//2
lbi r2,20		//5
halt			//6
lbi r2,30		//3
j -8			//4
halt			//never

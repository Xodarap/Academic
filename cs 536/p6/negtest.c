#include <stdio.h>
void main() {
	int x;
	int y;
	int z;
	y = 1;
	x = -4;
	z = x < y;
	printf("%d", z);
	z = y < x;
	printf("%d", z);
	z = y < -x;
	printf("%d", z);
}

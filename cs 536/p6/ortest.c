#include <stdio.h>
void main() {
	int x;
	int y;
	int z;
	x = -1;
	y = 2;
	z = x || y;
	printf("%d", z);
	z = -x || y;
	printf("%d", z);
}

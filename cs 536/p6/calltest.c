#include <stdio.h>
void foo(int x, int y, int z) {
	printf("%d", x);
	printf("%d", y);
	printf("%d", z);
	return;
}

void main() {
	foo(1,2,3);
}
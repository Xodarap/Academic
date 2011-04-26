#include <stdio.h>
int y;
int z;

void gloop() {
	int x;
	x = 3;
	y = 10;
	x++;
	printf("%d", x);
	if(x == 4) {
		y++;
		return;
	}
	return;
}

void blah() {
	int x;
	x = 2;
	x++;
	printf("%d", x);

	z = 5;
	while(z > 0){
		gloop();
		z--;
	}
	return;
}

void foo() {
	int x;
	x = 0;
	printf("%d", x);
	if(x == 0) {
		blah();
	}
	x++;
	if (x == 1) {
		blah();
	} else {
		gloop();
	}
	printf("%d", x);
	printf("%d", y);
	return;
}

void main() {
	foo();
	printf("%d", 2);
}


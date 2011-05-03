#include <stdio.h>
void main() {
	int x;
	int b;

  printf("\nExpected output:\n-5 -4 -3 -2 -1\n");
  b = -(1*1);
  if (b == -1) {
    x = -5;
    while (x<=b) {
      printf("%d", x);
      printf(" ");
      x = x + 1;
    }
  }
  else {
    printf("ERROR\n");
  }
  printf("\n");
}

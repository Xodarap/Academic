#include <stdio.h>

void f1(double d, double d2, int i) {
	printf("\n");
	printf("%f", d);
	printf("\n");
	printf("%f", d2);
	printf("\n");
	if( d == i)  { printf("here11\n"); }
	if( d <  i)  { printf("here12\n"); }
	if( d <= i)  { printf("here13\n"); }
	if( d >  i)  { printf("here14\n"); }
	if( d >= i)  { printf("here15\n"); }
	if( i == d)  { printf("here21\n"); }
	if( i <  d)  { printf("here22\n"); }
	if( i <= d)  { printf("here23\n"); }
	if( i >  d)  { printf("here24\n"); }
	if( i >= d)  { printf("here25\n"); }
	if( d == d2) { printf("here31\n"); }
	if( d <  d2) { printf("here32\n"); }
	if( d <= d2) { printf("here33\n"); }
	if( d >  d2) { printf("here34\n"); }
	if( d >= d2) { printf("here35\n"); }
	if( d == d2) { printf("here41\n"); }
	if( d <  d2) { printf("here42\n"); }
	if( d <= d2) { printf("here43\n"); }
	if( d >  d2) { printf("here44\n"); }
	if( d >= d2) { printf("here45\n"); }

	if( d == i)  { printf("here11\n"); } else { printf("there11"); }
	if( d <  i)  { printf("here12\n"); } else { printf("there12"); }
	if( d <= i)  { printf("here13\n"); } else { printf("there13"); }
	if( d >  i)  { printf("here14\n"); } else { printf("there14"); }
	if( d >= i)  { printf("here15\n"); } else { printf("there15"); }
	if( i == d)  { printf("here21\n"); } else { printf("there21"); }
	if( i <  d)  { printf("here22\n"); } else { printf("there22"); }
	if( i <= d)  { printf("here23\n"); } else { printf("there23"); }
	if( i >  d)  { printf("here24\n"); } else { printf("there24"); }
	if( i >= d)  { printf("here25\n"); } else { printf("there25"); }
	if( d == d2) { printf("here31\n"); } else { printf("there31"); }
	if( d <  d2) { printf("here32\n"); } else { printf("there32"); }
	if( d <= d2) { printf("here33\n"); } else { printf("there33"); }
	if( d >  d2) { printf("here34\n"); } else { printf("there34"); }
	if( d >= d2) { printf("here35\n"); } else { printf("there35"); }
	if( d == d2) { printf("here41\n"); } else { printf("there41"); }
	if( d <  d2) { printf("here42\n"); } else { printf("there42"); }
	if( d <= d2) { printf("here43\n"); } else { printf("there43"); }
	if( d >  d2) { printf("here44\n"); } else { printf("there44"); }
	if( d >= d2) { printf("here45\n"); } else { printf("there45"); }
	return;
}

void negTest(){
     double d;
     double d2;
     d = 1;
     d2 = -1;
	if( d == d2) { printf("here31\n"); }
	if( d <  d2) { printf("here32\n"); }
	if( d <= d2) { printf("here33\n"); }
	if( d >  d2) { printf("here34\n"); }
	if( d >= d2) { printf("here35\n"); }
	if( d2 == d) { printf("here41\n"); }
	if( d2 <  d) { printf("here42\n"); }
	if( d2 <= d) { printf("here43\n"); }
	if( d2 >  d) { printf("here44\n"); }
	if( d2 >= d) { printf("here45\n"); }

}

void main() {
	double d;
	double d2;
	int i;
	i = 123;
	d = 5.5423;
	d2 = 2.4242;
	printf("%f", d2);
	printf("\n");
	d = d2 + i;
	printf("%f", d);
	printf("\n");

	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d + d2 - i;
	printf("%f", d);
	printf("\n");
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");

	d = d - d2 * i;	
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d / d2 / i;
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d * i + d2;
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d + i - d2;
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d - i * d2;	
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	d = d / i / d2;
	printf("%d", d == d2);
	printf("%d", d < d2);
	printf("%d", d <= d2);
	printf("%d", d > d2);
	printf("%d", d >= d2);
	printf("\n");
	printf("%d", i == d2);
	printf("%d", i < d2);
	printf("%d", i <= d2);
	printf("%d", i > d2);
	printf("%d", i >= d2);
	printf("\n");
	printf("%d", d == i);
	printf("%d", d < i);
	printf("%d", d <= i);
	printf("%d", d > i);
	printf("%d", d >= i);
	printf("\n");
	if( d == i)  { printf("here11\n"); }
	if( d <  i)  { printf("here12\n"); }
	if( d <= i)  { printf("here13\n"); }
	if( d >  i)  { printf("here14\n"); }
	if( d >= i)  { printf("here15\n"); }
	if( i == d)  { printf("here21\n"); }
	if( i <  d)  { printf("here22\n"); }
	if( i <= d)  { printf("here23\n"); }
	if( i >  d)  { printf("here24\n"); }
	if( i >= d)  { printf("here25\n"); }
	if( d == d2) { printf("here31\n"); }
	if( d <  d2) { printf("here32\n"); }
	if( d <= d2) { printf("here33\n"); }
	if( d >  d2) { printf("here34\n"); }
	if( d >= d2) { printf("here35\n"); }
	if( d == d2) { printf("here41\n"); }
	if( d <  d2) { printf("here42\n"); }
	if( d <= d2) { printf("here43\n"); }
	if( d >  d2) { printf("here44\n"); }
	if( d >= d2) { printf("here45\n"); }

	if( d == i)  { printf("here11\n"); } else { printf("there11"); }
	if( d <  i)  { printf("here12\n"); } else { printf("there12"); }
	if( d <= i)  { printf("here13\n"); } else { printf("there13"); }
	if( d >  i)  { printf("here14\n"); } else { printf("there14"); }
	if( d >= i)  { printf("here15\n"); } else { printf("there15"); }
	if( i == d)  { printf("here21\n"); } else { printf("there21"); }
	if( i <  d)  { printf("here22\n"); } else { printf("there22"); }
	if( i <= d)  { printf("here23\n"); } else { printf("there23"); }
	if( i >  d)  { printf("here24\n"); } else { printf("there24"); }
	if( i >= d)  { printf("here25\n"); } else { printf("there25"); }
	if( d == d2) { printf("here31\n"); } else { printf("there31"); }
	if( d <  d2) { printf("here32\n"); } else { printf("there32"); }
	if( d <= d2) { printf("here33\n"); } else { printf("there33"); }
	if( d >  d2) { printf("here34\n"); } else { printf("there34"); }
	if( d >= d2) { printf("here35\n"); } else { printf("there35"); }
	if( d == d2) { printf("here41\n"); } else { printf("there41"); }
	if( d <  d2) { printf("here42\n"); } else { printf("there42"); }
	if( d <= d2) { printf("here43\n"); } else { printf("there43"); }
	if( d >  d2) { printf("here44\n"); } else { printf("there44"); }
	if( d >= d2) { printf("here45\n"); } else { printf("there45"); }

	negTest();
	f1(d, d2, i);
	f1(d*d2, d2 + (5.3432 - 23.4), i + 5);

}
/*
void foo (double d1, double d2, int i) {
	double a;
	double b;
	d1 = 2.0;
	d2 = 3.0;
	a = 4.0;
	b = 5.0;
	i = 5;
}

void main() {
	double a1;
	double a2;
	int    b;
	a1 = 1.0;
	a2 = 2.0;
	b  = 3;
	foo(a1, a2, b);
	printf("%f", a1);
	printf("\n");
	printf("%f", a2);
	printf("\n");
	printf("%d", b);
}
*/
/*
void main() {
	double a;
	double c;
	int b;
	c = 42132.4;
	a = 3.415232;
	b = 1;
	a = a + b;
	printf("%f", a);
	printf("\n");
	printf("%f", c);
}*/

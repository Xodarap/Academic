#include <stdio.h>
int gi1; int gi2;
int   one()  {
	int li1; int li2; 
	li1 = 3; li2 = 4;
	gi1 = 1; gi2 = 2;
	gi1  =  gi1 + li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 - li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 * gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 * gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 && gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 || gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 == gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 != li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 < li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 > gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 <= gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	printf("\nEnd  one()  simple\n");
	li2  =  -(-(li1)) ;
	printf("%d",  li2 );
	printf("\n");
	printf("\nEnd  one()  nested\n");
	if( (li2) >= (li1) ){
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  li2 ;
		printf("%d",k);
		l =  -(gi2) ;
		printf("%d",l);
	}
	printf("\nEnd  one()  if\n");
	if( (gi1) != (li2) ){
		int k; int l; k=1; l=2;
		printf("%d", gi2 );
		k =  li1 ;
		printf("%d",k);
		l =  !((!(li1)) - (!(gi1))) ;
		printf("%d",l);
	} else {
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  gi1 ;
		printf("%d",k);
		l =  !(-(-(gi1))) ;
		printf("%d",l);
	}
	printf("\nEnd  one()  else\n");
	li1 =  60 ;
	while(li1 > 0) {
		int k; int l; k=1; l=2;
		printf("%d", gi2 );
		k =  !((gi2) == (-(gi2))) ;
		printf("%d",k);
		l =  -(((gi2) && (li2)) * (-(gi2))) ;
		printf("%d",l);
		li1--;
	}
	printf("\nEnd  one()  while\n");
	printf("\nEnd  one()  call\n");
	return  !((li1) == ((li2) <= (((li1) - (li2)) && ((li2) >= (li2))))) ;
}
int   two(int li1, int li2)  {
	gi1 = 1; gi2 = 2;
	gi1  =  li2 + gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 - li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 * li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 * li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 && gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 || li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 == gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 != li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 < li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi2 > gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 <= gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	printf("\nEnd  two(int li1, int li2)  simple\n");
	gi1  =  -(-(li2)) ;
	printf("%d",  gi1 );
	printf("\n");
	printf("\nEnd  two(int li1, int li2)  nested\n");
	if( gi2 ){
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  li1 ;
		printf("%d",k);
		l =  (((gi2) < (gi2)) * ((gi2) == (gi1))) || (gi2) ;
		printf("%d",l);
	}
	printf("\nEnd  two(int li1, int li2)  if\n");
	if( !(-(-(li1))) ){
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  (li2) * ((gi2) < ((li1) - (li1))) ;
		printf("%d",k);
		l =  !(-(!(gi1))) ;
		printf("%d",l);
	} else {
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  -(((li2) && (gi2)) != (gi2)) ;
		printf("%d",k);
		l =  ((!(gi2)) <= (li2)) != ((!(gi2)) >= (-(li2))) ;
		printf("%d",l);
	}
	printf("\nEnd  two(int li1, int li2)  else\n");
	li1 =  92 ;
	while(li1 > 0) {
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  li1 ;
		printf("%d",k);
		l =  -(gi2) ;
		printf("%d",l);
		li1--;
	}
	printf("\nEnd  two(int li1, int li2)  while\n");
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	printf("\nEnd  two(int li1, int li2)  call\n");
	return  (li2) >= ((gi1) * (gi1)) ;
}
int   three(int li1, int li2)  {
	gi1 = 1; gi2 = 2;
	gi1  =  gi2 + gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 - gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 * gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 * gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 && li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 || gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 == gi1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 != li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 < li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 > gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 <= li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	printf("\nEnd  three(int li1, int li2)  simple\n");
	gi1  =  ((gi2) || (li1)) - (!(gi1)) ;
	printf("%d",  gi1 );
	printf("\n");
	printf("\nEnd  three(int li1, int li2)  nested\n");
	if( gi2 ){
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  li1 ;
		printf("%d",k);
		l =  !(li1) ;
		printf("%d",l);
	}
	printf("\nEnd  three(int li1, int li2)  if\n");
	if( (gi1) < (!((li2) || (li2))) ){
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  (gi2) && (-(li1)) ;
		printf("%d",k);
		l =  li2 ;
		printf("%d",l);
	} else {
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  (-((gi2) && (li2))) && ((-(gi1)) >= ((li1) >= (gi1))) ;
		printf("%d",k);
		l =  !(li1) ;
		printf("%d",l);
	}
	printf("\nEnd  three(int li1, int li2)  else\n");
	li1 =  47 ;
	while(li1 > 0) {
		int k; int l; k=1; l=2;
		printf("%d", li1 );
		k =  -((-(gi1)) + (gi1)) ;
		printf("%d",k);
		l =  li1 ;
		printf("%d",l);
		li1--;
	}
	printf("\nEnd  three(int li1, int li2)  while\n");
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	printf("\nEnd  three(int li1, int li2)  call\n");
	return  -(li1) ;
}
void   main()  {
	int li1; int li2; 
	li1 = 3; li2 = 4;
	gi1 = 1; gi2 = 2;
	gi1  =  gi2 + gi2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 - li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 * li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li2 * li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 && li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 || li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 == li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 != li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 < li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  li1 > li1 ;
	printf("%d",  gi1 );
	gi1  = 1;
	gi1  =  gi1 <= li2 ;
	printf("%d",  gi1 );
	gi1  = 1;
	printf("\nEnd  main()  simple\n");
	li1  =  gi2 ;
	printf("%d",  li1 );
	printf("\n");
	printf("\nEnd  main()  nested\n");
	if( gi1 ){
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  ((gi2) < ((li1) * (gi1))) || ((li2) >= (gi1)) ;
		printf("%d",k);
		l =  -((gi2) - (!(li1))) ;
		printf("%d",l);
	}
	printf("\nEnd  main()  if\n");
	if( !(!(!(gi1))) ){
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  gi1 ;
		printf("%d",k);
		l =  ((gi2) > (!(li2))) > ((gi2) && ((gi1) != (gi2))) ;
		printf("%d",l);
	} else {
		int k; int l; k=1; l=2;
		printf("%d", li2 );
		k =  li2 ;
		printf("%d",k);
		l =  li2 ;
		printf("%d",l);
	}
	printf("\nEnd  main()  else\n");
	li1 =  84 ;
	while(li1 > 0) {
		int k; int l; k=1; l=2;
		printf("%d", gi1 );
		k =  !(gi1) ;
		printf("%d",k);
		l =  (li1) > (!((li2) <= (li1))) ;
		printf("%d",l);
		li1--;
	}
	printf("\nEnd  main()  while\n");
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  three(li1, li2) ;
	printf("%d", li1);
	li1 =  three(li1, li2) ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  three(li1, li2) ;
	printf("%d", li1);
	li1 =  one() ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  two(li1, li2) ;
	printf("%d", li1);
	li1 =  three(li1, li2) ;
	printf("%d", li1);
	printf("\nEnd  main()  call\n");
}

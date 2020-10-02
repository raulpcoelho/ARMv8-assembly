/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int x, long long int a, long long int b, long long int c);

int main(void)
{
	long long int x;
	long long int a = 0, b = 64, c = 25;
	x = test(x, a, b, c);
	printf("x = %lld\n", x);
	return 0;
}


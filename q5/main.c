include <stdio.h>

extern long long int test();

int main(void)
{
	long long int x = 10;
	x = test(x);
	printf("%lld\n", x);
	return 0;
}


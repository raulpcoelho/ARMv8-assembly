#include <stdio.h>

extern long long int test(long long int x, long long y);

int main(void)
{
	long long int x = 0x0000000000000000, y = 0xffffffffffffffff;
	long long int y2 = test(x, y);
	printf("x antes: %llx\ny antes: %llx\ny depois: %llx\n", x,y,y2);
	return 0;
}


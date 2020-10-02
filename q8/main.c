#include <stdio.h>

extern int test(int *n);

int main(void)
{
	int n = 1234;
	int fat = test(&n);
	printf("Soma dos fatoriais dos digitos de %d = %d\n", n, fat);
	return 0;
}


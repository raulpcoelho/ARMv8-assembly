/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int x);

int main(void)
{
	long long int xAntes = 0; //0x0000000000000000 em hex
	long long int xDepois = test(xAntes); //a funcao devera retornar 0xffffffffffffffff
	printf("x antes:%llx\nx depois: %llx\n", xAntes, xDepois);

	return 0;
}


#include <stdio.h>

extern int test(int *v);

int main(void)
{
	int v[64] = {-9,8,7,6,5,4,3,2,1,0,19,18,17,16,15,14,13,12,11,10,
				 1,2,3,4,5,6,7,8,9,1,45,46,98,99,51,52,54,53,45,88,
				 5,6,7,1,2,3,-4,5,6,8,95,32,-21,53,46,18,82,16,74,13,
				 1,2,3,4};
	int maior = test(v);
	printf("O maior numero contido no vetor: %d\n", maior);
	return 0;
}


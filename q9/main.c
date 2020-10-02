#include <stdio.h>

extern long long int test(char *palavra, char *frase);

int main(void)
{
	char palavra[] = "aaa", frase[] = "abababababab";
	long long int x = test(palavra, frase);
	printf("A palavra %s pode ser formada %lld vez(es) com o conjunto %s.\n", palavra, x, frase);
	return 0;
}


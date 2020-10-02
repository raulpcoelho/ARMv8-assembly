#include <stdio.h>

extern long long int test(char *s);

int main(void)
{
	char s[] = "ABCDEFGHIOUAEIOU"; //10 vogais maiusculas
	long long int x = test(s);
	printf("Qtd de vogais: %lld\n", x);
	return 0;
}


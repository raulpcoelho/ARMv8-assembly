#include <stdio.h>

extern char test(char *a, char *b);

int main(void)
{
	char a[] = "GOTICOA", b[] = "GOTICO";
	char c = test(a, b);
	printf("%c\n", c);
	return 0;
}


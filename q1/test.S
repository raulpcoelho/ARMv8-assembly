	.globl test
test:
	mov X0, #0 // atribuindo 0 a X0
	cmp X1, #0 // compara X1 (variavel a) com o valor 0
	b.lt RetF // pula para retorno se X1 < 0
	cmp X2, #64 // compara X2 (variavel b) com o valor 64
	b.gt RetF // pula para retorno se X2 > 64
	cmp X3, #24 // compara X3 (variavel c) com o valor 24
	b.le RetF // pula para retorno se X3 <= 24
	mov X0, #1 // atribui 1 a X0 se todas condicoes sao atendidas
RetF:
	br X30


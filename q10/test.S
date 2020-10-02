	.globl test
test:
	mov X9, X0 // passa o endereco base do vetor para X9
	mov X10, #64 //inicia o contador em 64
	mov W11, #0x80000000 //guarda o menor inteiro negativo de 32 bits em W11
Loop:
	// a sequencia de passos a seguir encontra o valor maximo contido no vetor
	cbz X10, Ret //pula pra o retorno se o contador atingir 0
	ldur W12, [X9, #0] // ja que estamos trabalhando com int, guardaremos o valor em um registrador de 32 bits (W12)
	add X9, X9, #4 //adiciona 4 a X9, ja que estamos com int (4 bytes)
	sub X10, X10, #1 //decrementa 1 do contador
	cmp W12, W11 //compara W12 a W11
	b.gt Maior //se for maior faz um branch
	b Loop //volta ao inicio
Maior:
	mov W11, W12 //guarda o novo valor (W12) em W11
	b Loop //volta ao inicio
Ret:
	mov W0, W11 //passa o valor de W11 para W0 para que seja retornado
	br X30 //retorna


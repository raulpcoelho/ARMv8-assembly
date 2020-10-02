	.globl test
test:
	mov X12, X0 //nao faz parte do loop, usada apenas pra fazer teste na main

//sequencia de instrucoes que faz o que eh pedido na questao
Loop:
	cmp X12, XZR
	b.le Ret /*Se for menor ou igual a zero, encerra o loop. Nao podemos fazer b.eq ou cbz porque o registrador X12 pode guardar um valor negativo. Se esse fosse o caso e usassemos cbz, o loop seria infinito*/
	sub X12, X12, #1 //decrementa
	b Loop // Volta pro inicio

//Retorno
Ret:
	mov X0, X12 //move o valor de X12 para retornar
	br X30



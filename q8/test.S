	.globl test
test:
	mov X1, #0 // X1 ira guardar a soma dos fatoriais e eh iniciado em 0
	mov X10, X0 //passa o endereco parametro para X10
	mov X14, #10//guarda o valor 10 em X14, q sera usado para extrair os digitos
	mov X20, sp // passa o stack pointer para X20
	mov X19, #0 //contador de fatoriais calculados, inicia em 0
	ldur X13, [X10, #0]//guarda o numero do endereco parametro em X13. Sera util para restaurar o numero na memoria ao final de tudo
Loop:
	ldur X12, [X10, #0]//le o numero da memoria
	//Os calculos a seguir extraem o digito e guardam em X12. uso operadores aritmeticos
	//para calcular o modulo
	sdiv X15, X12, X14
	mul X16, X15, X14
	sub X12, X12, X16
	stur X15, [X10, #0]

	mov X0, X12 //move o digito para X0, para ser usado como parametro

	sub X20, X20, #16 //guarda X0 e o endereco de retorno na pilha
	stur X30, [X20, #8]
	stur X0, [X20, #0]

	bl fat //calcular o fatorial. Ele estara guardado em X2

	ldur X0, [X20, #0]//restaura X0 e o endereco de retorno
	ldur X30, [X20, #8]
	add X20, X20, #16

	sub X20, X20, #8 //Guarda o resultado do fatorial(X2) na pilha
	stur X2, [X20, #0]
	add X19, X19, #1 //incrementa a qtd de fatoriais calculados


	cmp X15, #0 //ve se ainda o numero restante eh igual a zero, se for pula pra somar
	b.eq Soma

	b Loop //se nao for igual a zero, inicia o processo novamente
Soma:
	cbz X19, Ret //se a qtd de fatoriais restantes for zero, pula pro retorno
	ldur X2, [X20, #0] //carrega um dos fatoriais guardados na pilha em X2
	add X20, X20, #8
	add X1, X1, X2 //adiciona o valor a X1, que guarda a soma
	sub X19, X19, #1 //decrementa X19
	b Soma

Ret:
	stur X13, [X10, #0] //restaura o numero ao seu valor inicial na memoria
	mov X0, X1 //passa o valor guardado em X1 para X0 para q seja retornado
	br X30 //retorna

fat:
	sub X20, X20, #16 //guarda o parametro X0 e o endereco de retorno na pilha
	stur X30, [X20, #8]
	stur X0, [X20, #0]

	cmp X0, #1 //ve se o parametro e maior ou igual a 1
	b.ge L1

	add X20, X20, #16 //se nao for, da um pop na pilha e retorna 1
	mov X2, #1
	br X30

L1:
	sub X0, X0, #1 //decrementa 1 do parametro para que seja calculado o fatorial recursivamente
	bl fat

	ldur X0, [X20, #0] //restaura X0 e o endereco de retorno
	ldur X30, [X20, #8]
	add X20, X20, #16

	mul X2, X2, X0 //faz a multiplicacao para q o fatorial seja calculado
	br X30 //retorna


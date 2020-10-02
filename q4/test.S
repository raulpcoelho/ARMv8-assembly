	.globl test
test:
	mov X11, X0 //passa o numero a ser negado para X11

	//faz a operacao e guarda em X10
	mov x12, #-1 // usado para fazer o (exclusive or) com o registrador X11
	eor X10, X11, X12 //apos esta operacao, o X10 sera o X11 negado

	//retorna
	mov X0, X10
	br X30


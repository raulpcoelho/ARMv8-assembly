	.globl test
test:
	//preparacao:
	mov X10, X0 // passa o primeiro parametro para X10
	mov X11, X1 // passa o segundo parametro para X11

	//quatro linhas a seguir fazem o que a questao pede:
	lsr X12, X10, #15 //passa os bits que queremos de X10 para a posicao adequada e grava em X12
	and X12, X12, 0x00000000fc000000 // mantem apenas os bits que queremos e zeramos o resto
	and X11, X11, 0xffffffff03ffffff // zera os bits que vao ser substituídos e mantém o resto
	orr X11, X11, X12 // finalmente substituímos os bits usando a operacao "ou"

	//retorno:
	mov X0, X11 //coloca o resultado em X0 para retornar
	br X30 //retorna



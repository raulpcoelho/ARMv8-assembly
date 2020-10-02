	.globl test
test:
	mov X10, X0 //carrega o endereco base do vetor em X10
	mov X1, #0 //inicia o contador de vogais em zero
Loop:
	ldurb W12, [X10, #0] //carrega da memoria o char da posicao atual em W12
	cmp W12, #0 //compara W12 com null pra ver se é o fim da string
	b.eq Ret // se for igual, pula pra retorno
	cmp W12, #65 // compara W12 com 'A'
	b.eq Inc // se for igual, pula pra incrementar
	cmp W12, #69 // compara W12 com 'E'
	b.eq Inc // se for igual, pular pra incrementar
	cmp W12, #73 // compara W12 com 'I'
	b.eq Inc // se for igual, pular pra incrementar
	cmp W12, #79 // compara W12 com 'O'
	b.eq Inc // se for igual, pular pra incrementar
	cmp W12, #85 // compara W12 com 'U'
	b.eq Inc // se for igual, pular pra incrementar
	add X10, X10, #1 // incrementa a posicao no vetor (como eh char, nao precisa multiplicar, pois eh 1byte)
	b Loop //volta pro inicio
Inc:
	add X1, X1, #1 //se encontrou alguma vogal, incrementa X1
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Ret:
	mov X0, X1 //passa o conteudo de X1 para X0 para q seja retornado
	br X30 //retorna


	.globl test
test:
	mov X10, X0 //carrega o endereco base da string1 em X10
	mov X11, #0 //inicia a pontuacao em zero
	mov X13, #0 //flag q indica que esta na primeira string
	b Loop
string2:
	mov X10, X1 //carrega o endereco base da string2 em X10
	mov X11, #0 //inicia a pontuacao em zero
	mov X13, #1 //flag q indica que esta na segunda string
Loop:
	ldurb W12, [X10, #0] //carrega da memoria o char da posicao atual em W12

	cmp W12, #0 //compara W12 com null pra ver se é o fim da string
	b.eq Pont1 // se for igual, pula pra guardar a pontuacao

	//1 ponto:
	cmp W12, #65 // compara W12 com 'A'
	b.eq Inc1 // se for igual, pula pra adicionar 1
	cmp W12, #69 // compara W12 com 'E'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #73 // compara W12 com 'I'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #79 // compara W12 com 'O'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #85 // compara W12 com 'U'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #78 // compara W12 com 'N'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #82 // compara W12 com 'R'
	b.eq Inc1 // se for igual, pular pra adicionar 1
	cmp W12, #83 // compara W12 com 'S'
	b.eq Inc1 // se for igual, pular pra adicionar 1

	//2 pontos:
	cmp W12, #68 // compara W12 com 'D'
	b.eq Inc2 // se for igual, pular pra adicionar 2
	cmp W12, #71 // compara W12 com 'G'
	b.eq Inc2 // se for igual, pular pra adicionar 2
	cmp W12, #84 // compara W12 com 'T'
	b.eq Inc2 // se for igual, pular pra adicionar 2

	//3 pontos:
	cmp W12, #66 // compara W12 com 'B'
	b.eq Inc3 // se for igual, pular pra adicionar 3
	cmp W12, #67 // compara W12 com 'C'
	b.eq Inc3 // se for igual, pular pra adicionar 3
	cmp W12, #77 // compara W12 com 'M'
	b.eq Inc3 // se for igual, pular pra adicionar 3
	cmp W12, #80 // compara W12 com 'P'
	b.eq Inc3 // se for igual, pular pra adicionar 3

	//4 pontos:
	cmp W12, #70 // compara W12 com 'F'
	b.eq Inc4 // se for igual, pular pra adicionar 4
	cmp W12, #72 // compara W12 com 'H'
	b.eq Inc4 // se for igual, pular pra adicionar 4
	cmp W12, #86 // compara W12 com 'V'
	b.eq Inc4 // se for igual, pular pra adicionar 4
	cmp W12, #87 // compara W12 com 'W'
	b.eq Inc4 // se for igual, pular pra adicionar 4
	cmp W12, #89 // compara W12 com 'Y'
	b.eq Inc4 // se for igual, pular pra adicionar 4

	//5 pontos:
	cmp W12, #75 // compara W12 com 'K'
	b.eq Inc5 // se for igual, pular pra adicionar 5

	//8 pontos:
	cmp W12, #74 // compara W12 com 'J'
	b.eq Inc8 // se for igual, pular pra adicionar 8
	cmp W12, #76 // compara W12 com 'L'
	b.eq Inc8 // se for igual, pular pra adicionar 8
	cmp W12, #88 // compara W12 com 'X'
	b.eq Inc8 // se for igual, pular pra adicionar 8

	//10 pontos:
	cmp W12, #81 // compara W12 com 'Q'
	b.eq Inc10 // se for igual, pular pra adicionar 10
	cmp W12, #90 // compara W12 com 'Z'
	b.eq Inc10 // se for igual, pular pra adicionar 10

	//Nenhum:
	add X10, X10, #1 //se por acaso houver um caractere diferente, apenas incrementa a posicao e volta pro inicio
	b Loop
Inc1:
	add X11, X11, #1 //adiciona 1 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc2:
	add X11, X11, #2 //adiciona 2 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc3:
	add X11, X11, #3 //adiciona 3 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc4:
	add X11, X11, #4 //adiciona 4 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc5:
	add X11, X11, #5 //adiciona 5 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc8:
	add X11, X11, #8 //adiciona 8 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio
Inc10:
	add X11, X11, #10 //adiciona 10 a pontuacao
	add X10, X10, #1 // incrementa a posicao no vetor
	b Loop // volta por inicio

Pont1:
	cmp X13, #1 //se estiver na string2 pula pra Pont2
	b.eq Pont2
	mov X16, X11 //caso contrario, guarda o resultado da string1 em X16
	b string2 //pula pra calcula string2
Pont2:
	cmp X16, X11 //se tiver calculado as duas strings, compara o resultado da string1 (X16) com o da string2 (X11)
	b.eq Empate //caso seja igual, pula pra Empate
	cmp X16, X11
	b.gt VitoriaA //caso seja maior pula pra VitoriaA
	b VitoriaB //caso seja menor pula pra VitoriaB

Empate:
	mov X5, #69 //guarda 'E' em X5
	b Ret
VitoriaA:
	mov X5, #65 //guarda 'A' em X5
	b Ret
VitoriaB:
	mov X5, #66 //guarda 'B' em X5
	b Ret
Ret:
	mov X0, X5 //guarda o valor de X5 em X0 pra poder retornar
	br X30 //retorna


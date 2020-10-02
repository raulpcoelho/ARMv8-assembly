	.globl test
test:
	mov X9, X0 //armazena o endereco base da palavra em X9
	mov X3, X1 //armazena o endereco base da frase em X3
	mov X1, 0x7fffffffffffffff //armazena o maior inteiro em X1, que vai guardar o resultado a ser retornado

//Explicando o raciocinio:
//para cada letra da palavra, percorre-se a mesma para ver quantas vezes aquela letra aparece na palavra (em caso de repeticao de caractere) e armazena no registrador X13
//logo depois percorre-se a frase e a cada caractere igual ao da posicao atual na palavra, adiciona-se 1 ao registrador X15 (iniciado em 0) e compara X15 a X13 pra ver se a meta foi atendida
//se X15 é igual a X13, a meta foi alcancada, o registrador X15 eh zerado e o X16 eh incrementado em 1 (X16 guarda quantas vezes a meta foi alcancada)
//continuamos percorrendo a frase para ver se a meta eh alcancada mais vezes
//apos percorrer a frase, comparamos X16 a X1, que guarda a qtd de vezes que a meta foi alcancada para o caractere da palavra que menos aparece na frase (pois ele eh o limitante)
//se X16 for menor que X1, essa qtd passa a ser a limitante e guardamos ela em X1
//quando todos os caracteres da palavra forem analisados, X1 estara com a resposta e ela eh retornada

Palavra:
	ldurb W10, [X9, #0] //carrega da memoria o caractere da palavra a ser analisado
	cmp W10, #0 //checa se chegou ao fim da string
	b.eq Finaliza
	mov X11, X0 //guarda o endereco base da palavra em X11
	mov X16, #0 //inicia o contador X16 em 0
	mov X13, #0 //inicia o contador X15 em 0
ContaPalavra:
	ldurb W12, [X11, #0] //carrega da memoria o caractere da palavra
	cmp W12, #0 //checa se eh o fim da string
	b.eq Frase
	cmp W12, W10 //compara o caractere atual ao caractere em analise
	b.eq IncContaPalavra //se for igual, pula pra incrementar a qtd
	add X11, X11, #1 //incrementa o endereco
	b ContaPalavra //volta ao inicio
IncContaPalavra:
	add X13, X13, #1 //incrementa o contador
	add X11, X11, #1 //incrementa o endereco
	b ContaPalavra //volta ao inicio
Frase:
	mov X14, X3 //guarda o endereco base da frase em X14
	mov X15, #0 //inicia o contador do caractere na frase em zero
ContaFrase:
	ldurb W12, [X14, #0] //carrega da memoria o caractere da posicao atual da frase em W12
	cmp W12, #0 //checa se eh o fim da frase
	b.eq Checa  //se for o fim da frase, pula para a fase de checagem
	cmp W12, W10 //compara com caractere da palavra sendo analisado
	b.eq IncContaFrase //se for igual pula pra incrementar a qtd
	add X14, X14, #1 //incrementa o endereco
	b ContaFrase //volta ao inicio
IncContaFrase:
	add X15, X15, #1 // incrementa o contador
	cmp X15, X13 //checa se atingiu a meta
	b.eq Possiveis //se sim, pula pra incrementar a qtd de vezes q a meta foi alcancada
	add X14, X14, #1 //incrementa o endereco
	b ContaFrase //volta ao inicio
Possiveis:
	add X16, X16, #1 // incrementa a qtd de vezes q a meta foi alcancada
	mov X15, #0 //zera X15
	add X14, X14, #1 //incrementa o endereco
	b ContaFrase //volta ao inicio
Checa:
	cmp X16, X1 //checa se X16 eh menor q X1
	b.lt AlteraPossiveis //se sim, ele se torna o novo limitante
	add X9, X9, #1 //incrementa o endereco na palavra para analisar outro caractere
	b Palavra
AlteraPossiveis:
	mov X1, X16 //X1 guarda o novo valor limitante
	add X9, X9, #1 //incrementa o endereco na palavra para analisar outro caractere
	b Palavra
Finaliza:
	mov X0, X1 //guarda o resultador em X0 para retornar
	br X30



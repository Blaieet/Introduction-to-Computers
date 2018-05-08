.define
	Dada 50h
.data 50h
	dada1: dB 45
	dada2: dB 3
.org 200h
	mvi H, 0
	mvi L, Dada
	mov a, M
	inx H
	mov c, M
	add c
	mov M, a	;guarda el resultat en dada2
	HLT
